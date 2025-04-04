#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/patternizer.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"


using namespace c74::min;

class ser_pattrnizer : public object<ser_pattrnizer> {
private:
    using PatternizerT = PatternizerDoubleWrapper<>::PatternizerT;

    // for now, we'll only support the default / facet patternizer
    PatternizerDoubleWrapper<> m_patternizer;

public:
    MIN_DESCRIPTION{""};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.interpolator"};

    inlet<> inlet_main{this, "(any) trigger",  "", true};
    inlet<> inlet_pattern{this, "(float/list/listoflists) pattern", "", false};
    inlet<> inlet_chord{this, "(float/list/listoflists) chord", "", false};

    outlet<> outlet_main{this, "(float/list/listoflists) chord output"};
    outlet<> dumpout{this, "(any) dumpout"};


    attribute<bool> enabled{
        this, Keywords::ENABLED, true, title{Titles::ENABLED}, description{Descriptions::ENABLED}, setter{
            MIN_FUNCTION {
                if (AttributeSetters::try_set_value(args, m_patternizer.enabled, cerr))
                    return args;
                return enabled;
            }
        }
    };


    attribute<int> voices{
        this, Keywords::NUM_VOICES, 0, title{Titles::NUM_VOICES}, description{Descriptions::ENABLED}, setter{
            MIN_FUNCTION {
                if (AttributeSetters::try_set_value(args, m_patternizer.num_voices, cerr))
                    return args;
                return voices;
            }
        }
    };


    attribute<int> mode{
        this, "mode", static_cast<int>(PatternizerT::DEFAULT_MODE), title{"mode"}, setter{
            MIN_FUNCTION {
                if (AttributeSetters::try_set_value(args, m_patternizer.mode, cerr))
                    return args;
                return mode;
            }
        }
    };

    attribute<int> strategy{
        this, "strategy", static_cast<int>(PatternizerT::DEFAULT_STRATEGY), title{"strategy"}, setter{
            MIN_FUNCTION {
                if (AttributeSetters::try_set_value(args, m_patternizer.strategy, cerr))
                    return args;
                return strategy;
            }
        }
    };


    attribute<bool> uses_index{
        this, "uses index", PatternizerT::DEFAULT_PATTERN_USES_INDEX, title{"uses index"}, setter{
            MIN_FUNCTION {
                if (AttributeSetters::try_set_value(args, m_patternizer.pattern_uses_index, cerr))
                    return args;
                return uses_index;
            }
        }
    };


    attribute<std::vector<double>> octave{
        this, "octave", {12.0}, title{"octave"}, setter{
            MIN_FUNCTION {
                if (AttributeSetters::try_set_vector(args, m_patternizer.octave, cerr))
                    return args;
                return octave;
            }
        }
    };


    function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            this->set_chord(args);
        } else if (inlet == 1) {
            this->set_pattern(args);
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


    message<> chord{this, "chord", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"chord\" for inlet " << inlet << endl;
            return {};
        }

        this->set_chord(args);
        return {};
    }}};


    message<> pattern{this, "pattern", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"pattern\" for inlet " << inlet << endl;
            return {};
        }

        this->set_pattern(args);
        return {};
    }}};

private:
    void process(const atoms& atms) {
        if (!SerialistTransport::get_instance().active()) {
            return;
        }

        auto& trigger = m_patternizer.trigger;

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

        auto& node = m_patternizer.patternizer_mode;
        node.update_time(SerialistTransport::get_instance().get_time());
        auto output = node.process();

        trigger.set_values(Voices<Trigger>::empty_like());

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }


    bool set_chord(const atoms& atms) {
        return AttributeSetters::try_set_voices(atms, m_patternizer.chord, cerr);
    }

    bool set_pattern(const atoms& atms) {
        return AttributeSetters::try_set_voices(atms, m_patternizer.pattern, cerr);
    }


};




MIN_EXTERNAL(ser_pattrnizer);