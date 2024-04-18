#include "c74_min.h"
#include "core/generatives/oscillator.h"
#include "parsing.h"
#include "max_timepoint.h"
#include "max_stereotypes.h"


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
                if (this->set_type(args))
                    return args;
                return type;
            }}
    };


    attribute<std::vector<double>> freq{this, "freq"
                                        , {0.1}
                                        , title{"Set frequency"}
                                        , description{""}
                                        , setter{MIN_FUNCTION {
                if (this->set_freq(args))
                    return args;
                return freq;
            }}
    };

    attribute<std::vector<double>> mul{this, "mul"
                                       , {1.0}
                                       , title{"Set multiplier"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                if (this->set_mul(args))
                    return args;
                return mul;
            }}
    };

    attribute<std::vector<double>> add{this, "add"
                                       , {0.0}
                                       , title{"Set additive"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                if (this->set_add(args))
                    return args;
                return add;
            }}
    };

    attribute<std::vector<double>> duty{this, "duty"
                                        , {0.5}
                                        , title{"Set duty"}
                                        , description{""}
                                        , setter{MIN_FUNCTION {
                if (this->set_duty(args))
                    return args;
                return duty;
            }}
    };

    attribute<std::vector<double>> curve{this, "curve"
                                         , {1.0}
                                         , title{"Set curve"}
                                         , description{""}
                                         , setter{MIN_FUNCTION {
                if (this->set_curve(args))
                    return args;
                return curve;
            }}
    };

    attribute<std::vector<double>> tau{this, "tau"
                                       , {0.0}
                                       , title{"Set tau"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                if (this->set_tau(args))
                    return args;
                return tau;
            }}
    };


    attribute<std::vector<double>> phase{this, "phase"
                                         , {0.0}
                                         , title{"Set phase"}
                                         , description{""}
                                         , setter{MIN_FUNCTION {
                if (this->set_phase(args))
                    return args;
                return phase;
            }}
    };

    attribute<bool> stepped{this, "stepped"
                            , true
                            , title{""}
                            , setter{MIN_FUNCTION {
                if (this->set_stepped(args))
                    return args;
                return stepped;
            }}
    };

    attribute<bool> enabled{this, "enabled"
                            , true
                            , title{""}
                            , setter{MIN_FUNCTION {
                if (this->set_enabled(args))
                    return args;
                return enabled;
            }}
    };


    attribute<int> voices{this, "voices"
                          , 0
                          , title{""}
                          , setter{MIN_FUNCTION {
                if (this->set_num_voices(args))
                    return args;
                return voices;
            }}
    };

    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}};


    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 3) {
            this->set_add(args);
        } else if (inlet == 2) {
            this->set_mul(args);
        } else if (inlet == 1) {
            this->set_freq(args);
        } else {
            this->process(args);
        }
        return {};
    };

    message<> period{this, "period", "In first inlet: set period", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"period\" for inlet" << inlet << endl;
            return {};
        }
        this->set_period(args);
        return {};
    }}};

    message<> stepsize{this, "stepsize", "In first inlet: alias for \"freq\"", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"stepsize\" for inlet" << inlet << endl;
            return {};
        }
        this->set_freq(args);
        return {};
    }}};

    message<> numsteps{this, "numsteps", "In first inlet: alias for \"period\"", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"numsteps\" for inlet" << inlet << endl;
            return {};
        }
        this->set_period(args);
        return {};
    }}};

    message<> list{this, "list", "Function depends on inlet", handle_input};
    message<> number{this, "number", "Function depends on inlet", handle_input};
    message<> bang{this, "bang", "In first inlet: trigger output for all voices", handle_input};

    // needed for messages beginning with 'null'
    message<> anything{this, "anything", "Function depends on inlet", handle_input};


private:
    void process(const atoms& args) {
        if (args.empty()) {
            // bang received: trigger all voices
            m_oscillator.trigger.set_values(Voices<Trigger>::singular(Trigger::pulse_on()));

        } else if (auto triggers = AtomParser::atoms2triggers(args)) {
            // trigger message received, trigger specific voices
            m_oscillator.trigger.set_values(*triggers);

        } else {
            cerr << "doesn't understand " << args[0] << endl;
            return;
        }

        auto time = MaxTimePoint::get_time_point_of(clock.get());
        if (!time) {
            cerr << *time.err() << endl;
            return;
        }

        m_oscillator.oscillator.update_time(*time);

        auto output = m_oscillator.oscillator.process();

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }


    bool set_type(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_oscillator.type, cerr);
    }


    bool set_freq(const atoms& args) {
        return AttributeSetters::try_set_vector<double>(args, m_oscillator.freq, cerr);
    }


    bool set_period(const atoms& args) {
        return AttributeSetters::try_set_vector<double, double>(args, m_oscillator.freq, cerr, [](const double& d) {
            return std::abs(d) < 1e-6 ? 0.0 : 1.0 / d;
        });
    }


    bool set_mul(const atoms& args) {
        return AttributeSetters::try_set_vector<double>(args, m_oscillator.mul, cerr);
    }


    bool set_add(const atoms& args) {
        return AttributeSetters::try_set_vector<double>(args, m_oscillator.add, cerr);
    }


    bool set_duty(const atoms& args) {
        return AttributeSetters::try_set_vector<double>(args, m_oscillator.duty, cerr);
    }


    bool set_curve(const atoms& args) {
        return AttributeSetters::try_set_vector<double>(args, m_oscillator.curve, cerr);
    }


    bool set_stepped(const atoms& args) {
        return AttributeSetters::try_set_value<bool>(args, m_oscillator.stepped, cerr);
    }


    bool set_tau(const atoms& args) {
        return AttributeSetters::try_set_vector<double>(args, m_oscillator.tau, cerr);
    }


    bool set_phase(const atoms& args) {
        return AttributeSetters::try_set_vector<double>(args, m_oscillator.phase, cerr);
    }


    bool set_enabled(const atoms& args) {
        return AttributeSetters::try_set_vector<bool>(args, m_oscillator.enabled, cerr);
    }


    bool set_num_voices(const atoms& args) {
        return AttributeSetters::try_set_value<std::size_t, int>(args, m_oscillator.num_voices, cerr);
    }


};


MIN_EXTERNAL(oscillator)