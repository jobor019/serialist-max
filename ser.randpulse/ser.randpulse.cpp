
#include "c74_min.h"
#include "oscillator.h"
#include "unit_pulse.h"
#include "parsing.h"
#include "max_timepoint.h"
#include "sequence.h"
#include "random_pulsator.h"

using namespace c74::min;


class RandomPulsatorWrapper {
public:
    ParameterHandler m_parameter_handler;

    Sequence<Facet, float> m_lower_bound{"", m_parameter_handler, 0.5f};
    Sequence<Facet, float> m_upper_bound{"", m_parameter_handler, 2.0f};

    Sequence<Facet, bool> m_enabled{"", m_parameter_handler, true};
    Variable<Facet, int> m_num_voices{"", m_parameter_handler, 1};

    RandomPulsatorNode m_random_pulsator{"", m_parameter_handler, &m_lower_bound, &m_upper_bound
                                         , &m_enabled, &m_num_voices};

};

class randpulse : public object<randpulse> {
public:
    MIN_DESCRIPTION{"Multi-channel random pulse"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.pulsator"};

    inlet<> main_inlet{this, "(bang) control messages"};
    inlet<> lb_inlet{this, "(float/list) lower bound"};
    inlet<> ub_inlet{this, "(float/list) upper bound"};

    outlet<> outlet{this, "(float/list) oscillator output"};

    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}};


    explicit randpulse(const atoms& args = {}) {
        metro.delay(1.0);
    }


    timer<> metro{this, MIN_FUNCTION {
        on_callback();
        metro.delay(1.0);
        return {};
    }};


    c74::min::function handle_input = MIN_FUNCTION {
        switch (inlet) {
            case 0:
                cerr << "unknown message" << endl;
                break;
            case 1:
                set_lower_bound(args);
                break;
            case 2:
                set_upper_bound(args);
                break;
            default:
                cerr << "invalid inlet" << endl;
        }
        return {};
    };

    message<> lbound{this, "lbound", "(bang) set lower bound", MIN_FUNCTION {
        set_lower_bound(args);
        return {};
    }};

    message<> ubound{this, "ubound", "(bang) set upper bound", MIN_FUNCTION {
        set_upper_bound(args);
        return {};
    }};

    message<> enabled{this, "enabled", "(bool/list) my docstring for enabled arg", MIN_FUNCTION {
        set_enabled(args);
        return {};
    }};

    message<> voices{this, "voices", "(int) my docstring for num_voices arg", MIN_FUNCTION {
        set_num_voices(args);
        return {};
    }};

    message<> list{this, "list", "my docstring for list arg", handle_input};
    message<> number{this, "number", "mydocstring for float arg", handle_input};

private:

    void on_callback() {
        auto time = MaxTimePoint::get_time_of(clock.get());
        if (!time) {
            cerr << "unknown clock source" << endl;
            return;
        }
        auto time_point = time->as_time_point();


        m_random_pulsator.m_random_pulsator.update_time(time_point);
        auto triggers = m_random_pulsator.m_random_pulsator.process();

        if (triggers.is_empty_like()) {
            return;
        }

        atoms output;
        for (const auto& trigger: triggers.fronts()) {
            if (trigger) {
                output.emplace_back("bang");
            } else {
                output.emplace_back("null");
            }
        }
        outlet.send(output);
    }


    void set_lower_bound(const atoms& args) {
        cout << "setting lb" << endl;
        if (auto v = parsing::from_atoms<float>(args)) {
            m_random_pulsator.m_lower_bound.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_upper_bound(const atoms& args) {
        cout << "setting ub" << endl;
        if (auto v = parsing::from_atoms<float>(args)) {
            m_random_pulsator.m_upper_bound.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_enabled(const atoms& args) {
        cout << "setting enabled" << endl;
        if (auto v = parsing::from_atoms<bool>(args)) {
            m_random_pulsator.m_enabled.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_num_voices(const atoms& args) {
        if (auto v = parsing::parse_single<int>(args)) {
            m_random_pulsator.m_num_voices.set_value(v.ok());
        } else {
            cerr << v.err() << endl;
            return;
        }
    }


    RandomPulsatorWrapper m_random_pulsator;
};


MIN_EXTERNAL(randpulse);