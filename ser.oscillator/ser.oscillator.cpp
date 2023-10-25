#include "c74_min.h"
#include "core/generatives/oscillator.h"
#include "parsing.h"
#include "max_timepoint.h"


using namespace c74::min;


class oscillator : public object<oscillator> {
private:
    // MEMBER VARIABLES (position enforced by c74::min architecture)
    OscillatorWrapper<double> m_oscillator;

public:
    MIN_DESCRIPTION{"Multi-channel oscillator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.generator, ser.pulsator"};

    inlet<> inlet_main{this, "(any) control messages"};
    inlet<> inlet_freq{this, "(float/list) freq"};
    inlet<> inlet_mul{this, "(float/list) mul"};
    inlet<> inlet_add{this, "(float/list) add"};

    outlet<> outlet_main{this, "(float/list) oscillator output"};
    outlet<> dumpout{this, "(any) dumpout"};


    attribute<std::vector<int>> type{this, "type"
                                     , {0}
                                     , title{"Set oscillator type"}
                                     , description{""}
                                     , setter{MIN_FUNCTION {
                if (set_type(args))
                    return args;
                return type;
            }}
    };


    attribute<std::vector<double>> freq{this, "freq"
                                        , {0.1}
                                        , title{"Set frequency"}
                                        , description{""}
                                        , setter{MIN_FUNCTION {
                if (set_freq(args))
                    return args;
                return freq;
            }}
    };

    attribute<std::vector<double>> mul{this, "mul"
                                       , {1.0}
                                       , title{"Set multiplier"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                if (set_mul(args))
                    return args;
                return mul;
            }}
    };

    attribute<std::vector<double>> add{this, "add"
                                       , {0.0}
                                       , title{"Set additive"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                if (set_add(args))
                    return args;
                return add;
            }}
    };

    attribute<std::vector<double>> duty{this, "duty"
                                        , {0.5}
                                        , title{"Set duty"}
                                        , description{""}
                                        , setter{MIN_FUNCTION {
                if (set_duty(args))
                    return args;
                return duty;
            }}
    };

    attribute<std::vector<double>> curve{this, "curve"
                                         , {1.0}
                                         , title{"Set curve"}
                                         , description{""}
                                         , setter{MIN_FUNCTION {
                if (set_curve(args))
                    return args;
                return curve;
            }}
    };

    attribute<std::vector<double>> tau{this, "tau"
                                       , {0.0}
                                       , title{"Set tau"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                if (set_tau(args))
                    return args;
                return tau;
            }}
    };


    attribute<std::vector<double>> phase{this, "phase"
                                         , {0.0}
                                         , title{"Set phase"}
                                         , description{""}
                                         , setter{MIN_FUNCTION {
                if (set_phase(args))
                    return args;
                return phase;
            }}
    };

    attribute<bool> stepped{this, "stepped"
                            , true
                            , title{""}
                            , setter{MIN_FUNCTION {
                if (set_stepped(args))
                    return args;
                return stepped;
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
                          , 0
                          , title{""}
                          , setter{MIN_FUNCTION {
                if (set_num_voices(args))
                    return args;
                return voices;
            }}
    };

    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}};


    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 3) {
            set_add(args);
        } else if (inlet == 2) {
            set_mul(args);
        } else if (inlet == 1) {
            set_freq(args);
        } else {
            process(args);
        }
        return {};
    };

    message<> period{this, "period", "In first inlet: set period", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"period\" for inlet" << inlet << endl;
            return {};
        }
        set_period(args);
        return {};
    }}};

    message<> stepsize{this, "stepsize", "In first inlet: alias for \"freq\"", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"stepsize\" for inlet" << inlet << endl;
            return {};
        }
        set_freq(args);
        return {};
    }}};

    message<> numsteps{this, "numsteps", "In first inlet: alias for \"period\"", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"numsteps\" for inlet" << inlet << endl;
            return {};
        }
        set_period(args);
        return {};
    }}};

    message<> list{this, "list", "Function depends on inlet", handle_input};
    message<> number{this, "number", "Function depends on inlet", handle_input};
    message<> bang{this, "bang", "In first inlet: trigger output for all voices", handle_input};


private:
    void process(const atoms& args) {
        if (args.empty()) {
            // bang received: trigger all voices
            m_oscillator.trigger.set_values(Voices<Trigger>::singular(Trigger::pulse_on));

        } else if (auto triggers = parsing::atoms2triggers(args)) {
            // trigger message received, trigger specific voices
            m_oscillator.trigger.set_values(*triggers);

        } else {
            cerr << "doesn't understand " << args[0] << endl;
            return;
        }

        auto time = MaxTimePoint::get_time_of(clock.get());
        if (!time) {
            cerr << "unknown clock source" << endl;
            return;
        }

        auto time_point = time->as_time_point();

        m_oscillator.oscillator.update_time(time_point);

        auto output = m_oscillator.oscillator.process();
//        cout << voices.size() << endl;


//        if (auto front = voices.front()) {
//            cout << static_cast<double>(*front) << endl;
//        } else {
//            cout << "NO ITEM IN VOICE" << endl;
//        }


        auto formatted_atoms = parsing::voices2atoms<float>(output);
        if (formatted_atoms.is_ok()) {
            outlet_main.send(formatted_atoms.ok());
        } else {
            cerr << "failed to parse output" << endl;
        }
    }


    bool set_type(const atoms& args) {
        cout << "setting type" << endl;
        if (auto v = parsing::atoms2vec<Oscillator::Type>(args)) {
            auto t = Voices<Oscillator::Type>::transposed(*v);
            m_oscillator.type.set_values(t);
            return true;
        } else {
            cerr << v.err() << endl;
            return false;
        }
    }


    bool set_freq(const atoms& args) {
        cout << "setting freq" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto f = Voices<double>::transposed(*v);
            m_oscillator.freq.set_values(f);
            return true;
        } else {
            cerr << v.err() << endl;
            return false;
        }
    }


    bool set_period(const atoms& args) {
        cout << "setting period" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto f = Voices<double>::transposed(v.ok().map([](auto x) {
                return std::abs(x) < 1e-6 ? 0.0 : 1.0 / x;
            }));
            m_oscillator.freq.set_values(f);
            return true;

        } else {
            cerr << v.err() << endl;
            return false;
        }


    }


    bool set_mul(const atoms& args) {
        cout << "setting mul" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto f = Voices<double>::transposed(*v);
            m_oscillator.mul.set_values(f);
            return true;
        } else {
            cerr << v.err() << endl;
            return false;
        }
    }


    bool set_add(const atoms& args) {
        cout << "setting add" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto f = Voices<double>::transposed(*v);
            m_oscillator.add.set_values(f);
            return true;
        } else {
            cerr << v.err() << endl;
            return false;
        }
    }


    bool set_duty(const atoms& args) {
        cout << "setting duty" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto f = Voices<double>::transposed(*v);
            m_oscillator.duty.set_values(f);
            return true;
        } else {
            cerr << v.err() << endl;
            return false;
        }
    }


    bool set_curve(const atoms& args) {
        cout << "setting curve" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto f = Voices<double>::transposed(*v);
            m_oscillator.curve.set_values(f);
            return true;
        } else {
            cerr << v.err() << endl;
            return false;
        }
    }


    bool set_stepped(const atoms& args) {
        cout << "setting stepped" << endl;
        if (auto v = parsing::atoms2value<bool>(args)) {
            m_oscillator.stepped.set_value(*v);
            return true;
        } else {
            cerr << v.err() << endl;
            return false;
        }
    }


    bool set_tau(const atoms& args) {
        cout << "setting tau" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto f = Voices<double>::transposed(*v);
            m_oscillator.tau.set_values(f);
            return true;
        } else {
            cerr << v.err() << endl;
            return false;
        }
    }


    bool set_phase(const atoms& args) {
        cout << "setting phase" << endl;
        if (auto v = parsing::atoms2vec<double>(args)) {
            auto f = Voices<double>::transposed(*v);
            m_oscillator.phase.set_values(f);
            return true;
        } else {
            cerr << v.err() << endl;
            return false;
        }
    }


    bool set_enabled(const atoms& args) {
        cout << "setting enabled" << endl;
        if (auto v = parsing::atoms2vec<bool>(args)) {
            auto e = Voices<bool>::transposed(*v);
            m_oscillator.enabled.set_values(e);
            return true;

        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_num_voices(const atoms& args) {
        if (auto v = parsing::atoms2value<int>(args)) {
            m_oscillator.num_voices.set_value(static_cast<std::size_t >(*v));
            return true;

        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


};


MIN_EXTERNAL(oscillator);