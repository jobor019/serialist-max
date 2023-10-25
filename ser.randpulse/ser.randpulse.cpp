
#include "c74_min.h"


#include "core/generatives/sequence.h"
#include "core/generatives/variable.h"
#include "core/generatives/random_pulsator.h"

#include "parsing.h"
#include "max_timepoint.h"

using namespace c74::min;




class randpulse : public object<randpulse> {
private:
    // MEMBER VARIABLES (position enforced by c74::min architecture)
    RandomPulsatorWrapper<double> m_pulsator;
    std::mutex m_mutex;

public:
    MIN_DESCRIPTION{"Multi-channel random pulsator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.pulsator"};

    inlet<> inlet_main{this, "(any) control messages"};
    inlet<> inlet_min{this, "(float/list) minimum duration"};
    inlet<> inlet_max{this, "(float/list) maximum duration"};
    inlet<> inlet_pw{this, "(float/list) pulse width"};


    outlet<> outlet_main{this, "(float/list) pulse output"};
    outlet<> dumpout{this, "(any) dumpout"};


    explicit randpulse(const atoms& = {}) {
        metro.delay(1.0);
    }


    timer<> metro{this, MIN_FUNCTION {
        on_callback();
        metro.delay(1.0);
        return {};
    }};


    attribute<std::vector<double>> min{this, "min"
                                       , Vec<double>::singular(0.25).vector()
                                       , title{"Set minimum duration"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                if (set_lower_bound(args))
                    return args;
                return min;
            }}
    };


    attribute<std::vector<double>> max{this, "max"
                                       , Vec<double>::singular(4.0).vector()
                                       , title{"Set maximum duration"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                if (set_upper_bound(args))
                    return args;
                return max;
            }}
    };


    attribute<std::vector<double>> pulse_width{this, "pulse_width"
                                               , Vec<double>::singular(1.0).vector()
                                               , title{"Set pulse width"}
                                               , description{""}
                                               , setter{MIN_FUNCTION {
                if (set_pulse_width(args))
                    return args;
                return pulse_width;
            }}
    };


    attribute<bool> enabled{this, "enabled"
                            , true
                            , title{""}
                            , setter{MIN_FUNCTION {
                if (set_enabled(args))
                    return args;
                return enabled;
            }}
    };


    attribute<int> voices{this, "voices"
                          , 1
                          , title{""}
                          , setter{MIN_FUNCTION {
                if (set_num_voices(args))
                    return args;
                return voices;
            }}
    };


    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}};


    message<> flush{this, "flush", "(bang) flush held notes", MIN_FUNCTION {
        // TODO
        cwarn << "flush is not implemented yet" << endl;
        return {};
    }};

    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 3) {
            set_pulse_width(args);
        } else if (inlet == 2) {
            set_upper_bound(args);
            return {};
        } else if (inlet == 1) {
            set_lower_bound(args);
            return {};
        } else {
            if (!args.empty())
                cerr << "doesn't understand " << args[0] << endl;
        }

        return {};
    };


    message<> list{this, "list", "Function depends on inlet", handle_input};
    message<> number{this, "number", "Function depends on inlet", handle_input};

private:
    void on_callback() {
        auto time = MaxTimePoint::get_time_of(clock.get());
        if (!time) {
            cerr << "unknown clock source" << endl;
            return;
        }
        auto time_point = time->as_time_point();


        // CRITICAL SECTION: BEGIN //

        std::unique_lock lock(m_mutex, std::try_to_lock);
        if (!lock.owns_lock()) {
            return;
        }

        m_pulsator.random_pulsator.update_time(time_point);
        auto triggers = m_pulsator.random_pulsator.process();
        lock.unlock();

        // CRITICAL SECTION: END //


        if (triggers.is_empty_like()) {
            return;
        }


        auto [pulse_ons, pulse_offs] = triggers.partition([](const auto& trigger) {
            return trigger == Trigger::pulse_on;
        });

        if (auto parsed = parsing::triggers2atoms(pulse_offs)) {
            outlet_main.send(*parsed);
        } else {
            std::cout << "parsed pulse offs error: " << std::endl;
            cerr << parsed.err().message() << endl;
        }

        if (auto parsed = parsing::triggers2atoms(pulse_ons)) {
            outlet_main.send(*parsed);
        } else {
            std::cout << "parsed pulse ons error: " << std::endl;
            cerr << parsed.err().message() << endl;
        }
    }


    bool set_lower_bound(const atoms& args) {
        cout << "setting lb" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto lb = Voices<double>::transposed(*v);
            std::lock_guard lock{m_mutex};
            m_pulsator.lower_bound.set_values(lb);
            return true;

        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_upper_bound(const atoms& args) {
        cout << "setting ub" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto ub = Voices<double>::transposed(*v);
            std::lock_guard lock{m_mutex};
            m_pulsator.upper_bound.set_values(ub);
            return true;

        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_pulse_width(const atoms& args) {
        cout << "setting pw" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto pw = Voices<double>::transposed((*v).clip({0.0}, {1.0}));
            std::lock_guard lock{m_mutex};
            m_pulsator.pulse_width.set_values(pw);
            return true;

        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_enabled(const atoms& args) {
        cout << "setting enabled" << endl;
        if (auto v = parsing::atoms2vec<bool>(args)) {
            auto e = Voices<bool>::transposed(*v);
            std::lock_guard lock{m_mutex};
            m_pulsator.enabled.set_values(e);
            return true;

        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_num_voices(const atoms& args) {
        if (auto v = parsing::atoms2value<int>(args)) {
            std::lock_guard lock{m_mutex};
            m_pulsator.num_voices.set_value(static_cast<std::size_t >(*v));
            return true;

        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


};


MIN_EXTERNAL(randpulse)