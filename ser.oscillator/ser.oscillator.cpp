#include <core/policies/policies.h>
#include <core/generatives/oscillator.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_timepoint.h"
#include "max_stereotypes.h"


using namespace c74::min;
using namespace serialist;

class ser_oscillator : public object<ser_oscillator> {
private:
    OscillatorWrapper<double> m_oscillator;

public:
    MIN_DESCRIPTION{"Multi-channel oscillator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.generator, ser.pulsator"};

    inlet<> inlet_main{this, "(any) control messages"};
    inlet<> inlet_period{this, "(float/list) period"};

    outlet<> outlet_main{this, "(float/list) oscillator output"};
    outlet<> dumpout{this, "(any) dumpout"};

    attribute<symbol> clock{this, Keywords::CLOCK
                            , ""
                            , title{Titles::CLOCK}
                            , description{Descriptions::CLOCK}};


    attribute<bool> enabled{this, Keywords::ENABLED
                            , true
                            , title{Titles::ENABLED}
                            , description{Descriptions::ENABLED}
                            , setter{MIN_FUNCTION {
                if (set_enabled(args))
                    return args;
                return enabled;
            }}
    };


    attribute<int> voices{this, Keywords::NUM_VOICES
                          , 0
                          , title{Titles::NUM_VOICES}
                          , description{Descriptions::ENABLED}
                          , setter{MIN_FUNCTION {
                if (set_num_voices(args))
                    return args;
                return voices;
            }}
    };


    attribute<int> mode{this, "mode"
                        , static_cast<int>(PhaseAccumulator::DEFAULT_MODE)
                        , title{"Set oscillator mode"}
                        , description{""}
                        , setter{MIN_FUNCTION {
                if (this->set_mode(args))
                    return args;
                return mode;
            }}
    };


    attribute<int> waveform{this, "waveform"
                            , static_cast<int>(Waveform::DEFAULT_TYPE)
                            , title{"Set oscillator waveform"}
                            , description{""}
                            , setter{MIN_FUNCTION {
                if (this->set_waveform(args))
                    return args;
                return waveform;
            }}
    };


    attribute<std::vector<double>> period{this, "period"
                                          , Vec<double>::singular(PaParameters::DEFAULT_PERIOD).vector()
                                          , title{"Set period"}
                                          , description{""}
                                          , setter{MIN_FUNCTION {
                if (this->set_period(args))
                    return args;
                return period;
            }}
    };

    attribute<int> periodtype{this, "periodtype"
                              , static_cast<int>(PaParameters::DEFAULT_PERIOD_TYPE)
                              , title{"Set period type"}
                              , description{""}
                              , setter{MIN_FUNCTION {
                if (this->set_period_type(args))
                    return args;
                return periodtype;
            }}
    };


    attribute<std::vector<double>> offset{this, "offset"
                                          , Vec<double>::singular(PaParameters::DEFAULT_OFFSET).vector()
                                          , title{"Set offset"}
                                          , description{""}
                                          , setter{MIN_FUNCTION {
                if (this->set_offset(args))
                    return args;
                return offset;
            }}
    };

    attribute<int> offsettype{this, "offsettype"
                              , static_cast<int>(PaParameters::DEFAULT_OFFSET_TYPE)
                              , title{"Set offset type"}
                              , description{""}
                              , setter{MIN_FUNCTION {
                if (this->set_offset_type(args))
                    return args;
                return offsettype;
            }}
    };


    attribute<std::vector<double>> stepsize{this, "stepsize"
                                            , Vec<double>::singular(PaParameters::DEFAULT_STEP_SIZE).vector()
                                            , title{"Set step size"}
                                            , description{""}
                                            , setter{MIN_FUNCTION {
                if (this->set_step_size(args))
                    return args;
                return stepsize;
            }}
    };


    attribute<std::vector<double>> duty{this, "duty"
                                        , {Waveform::DEFAULT_DUTY}
                                        , title{"Set duty"}
                                        , description{""}
                                        , setter{MIN_FUNCTION {
                if (this->set_duty(args))
                    return args;
                return duty;
            }}
    };

    attribute<std::vector<double>> curve{this, "curve"
                                         , {Waveform::DEFAULT_CURVE}
                                         , title{"Set curve"}
                                         , description{""}
                                         , setter{MIN_FUNCTION {
                if (this->set_curve(args))
                    return args;
                return curve;
            }}
    };

    attribute<std::vector<double>> tau{this, "tau"
                                       , {FilterSmoo::DEFAULT_TAU}
                                       , title{"Set tau"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                if (this->set_tau(args))
                    return args;
                return tau;
            }}
    };


    attribute<int> tautype{this, "tautype"
                           , static_cast<int>(FilterSmoo::DEFAULT_TAU_TYPE)
                           , title{"Set tau type"}
                           , description{""}
                           , setter{MIN_FUNCTION {
                if (this->set_tau_type(args))
                    return args;
                return tautype;
            }}
    };


    c74::min::function handle_input = MIN_FUNCTION {
         if (inlet == 1) {
            this->set_period(args);
        } else {
            this->process(args);
        }
        return {};
    };


    message<> bang = Messages::bang_message(this, handle_input);
    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);


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
            cerr << time.err() << endl;
            return;
        }

        m_oscillator.oscillator.update_time(*time);

        auto output = m_oscillator.oscillator.process();

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }


    bool set_mode(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_oscillator.mode, cerr);
    }

    bool set_waveform(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_oscillator.waveform, cerr);
    }


    bool set_period(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_oscillator.period, cerr);
    }

    bool set_period_type(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_oscillator.period_type, cerr);
    }

    bool set_offset(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_oscillator.offset, cerr);
    }

    bool set_offset_type(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_oscillator.offset_type, cerr);
    }

    bool set_step_size(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_oscillator.step_size, cerr);
    }

    bool set_duty(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_oscillator.duty, cerr);
    }

    bool set_curve(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_oscillator.curve, cerr);
    }

    bool set_tau(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_oscillator.tau, cerr);
    }

    bool set_tau_type(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_oscillator.tau_type, cerr);
    }


    bool set_enabled(const atoms& args) {
        return AttributeSetters::try_set_vector<bool>(args, m_oscillator.enabled, cerr);
    }


    bool set_num_voices(const atoms& args) {
        return AttributeSetters::try_set_value<std::size_t, int>(args, m_oscillator.num_voices, cerr);
    }


};


MIN_EXTERNAL(ser_oscillator)