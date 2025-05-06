#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/random_node.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"
#include "attribute_setters.h"
#include "message_stereotypes.h"


using namespace c74::min;
using namespace serialist;


class ser_random : public object<ser_random> {
private:
    RandomWrapper<> m_random;

public:
    MIN_DESCRIPTION{"Random generator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.oscillator, ser.patternizer"};

    inlet<> inlet_main{this, "(trigger) trigger", ""};
    inlet<> inlet_size{this, "(int/list) chord size", "", false};
    inlet<> inlet_random_spec{this, "(int/float/list/listoflists) quantization / weights", "", false};

    outlet<> outlet_main{this, "(double/list/listoflists) output", ""};
    outlet<> dumpout{this, "(any) dumpout"};

    attribute<bool> enabled{this, AttributeNames::ENABLED
                            , true
                            , title{Titles::ENABLED}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_random.enabled, cerr))
                return args;
            return enabled;
        }}
    };

    attribute<int> voices{this, AttributeNames::NUM_VOICES
                          , 0
                          , title{Titles::NUM_VOICES}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_random.num_voices, cerr))
                return args;
            return voices;
        }}
    };

    attribute<RandomHandler::Mode> mode{
        this, "mode", RandomHandler::DEFAULT_MODE, title{"mode"}, setter{
            MIN_FUNCTION {
                if (AttributeSetters::try_set_value(args, m_random.mode, cerr))
                    return args;
                return mode;
            }
        }
    };

    // attribute<int> repetitions
    attribute<int> repetitions{
        this, "repetitions", static_cast<int>(RandomHandler::DEFAULT_REPETITIONS), title{"repetitions"}, setter{
            MIN_FUNCTION {
                if (AttributeSetters::try_set_value(args, m_random.repetition_strategy, cerr))
                    return args;
                return repetitions;
            }
        }};


    attribute<std::vector<int>> chordsize{this
        , "chordsize"
        , Vec<int>::singular(RandomHandler::DEFAULT_CHORD_SIZE).vector()
        , title{"chordsize"}, setter{ MIN_FUNCTION {
            if (AttributeSetters::try_set_vector(args, m_random.chord_size, cerr))
                return args;
            return chordsize;
            }
    }};


    attribute<double> brownianstep{this, "brownianstep", RandomHandler::DEFAULT_BROWNIAN_STEP, title{"brownianstep"}, setter{
        MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_random.max_brownian_step, cerr))
                return args;
            return brownianstep;
        }
    }};


    attribute<double> explowerbound{this, "explowerbound", RandomHandler::DEFAULT_BROWNIAN_STEP, title{"explowerbound"}, setter{
        MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_random.exp_lower_bound, cerr))
                return args;
            return explowerbound;
        }
    }};


    message<> quantization{this, "quantization", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"chord\" for inlet " << inlet << endl;
            return {};
        }

        this->set_random_spec(args);
        return {};
    }}};


    message<> weights{this, "weights", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"chord\" for inlet " << inlet << endl;
            return {};
        }

        this->set_random_spec(args);
        return {};
    }}};





    function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            this->set_random_spec(args);
        } else if (inlet == 1) {
            chordsize.set(args);
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

    void process(const atoms& atms) {
        if (!SerialistTransport::get_instance().active()) {
            return;
        }

        auto& trigger = m_random.trigger;

        if (atms.empty()) {
            // bang received: trigger all voices
            trigger.set_values(Voices<Trigger>::singular(Trigger::pulse_on()));
        } else {
            auto triggers = AtomParser::atoms2triggers(atms, false);

            if (!triggers || triggers->is_empty_like()) {
                return;
            }

            trigger.set_values(*triggers);
        }

        auto& node = m_random.random;
        node.update_time(SerialistTransport::get_instance().get_time());
        auto output = node.process();

        trigger.set_values(Voices<Trigger>::empty_like());

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }


    void set_random_spec(const atoms& atms) {
        if (auto spec = AtomParser::atoms2voices<double>(atms)) {
            // Note: this inlet / message is used for both quantization and weights as they are mutually exclusive:
            //       weights only apply to Mode::weighted, quantization only applies to other modes
            m_random.num_quantization_steps.set_values(spec->as_type<std::size_t>());
            m_random.weights.set_values(*spec);

        } else {
            cerr << spec.err().message() << endl;
        }
    }



};


MIN_EXTERNAL(ser_random);
