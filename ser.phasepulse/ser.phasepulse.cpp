#include <core/policies/policies.h>
#include <core/generatives/phase_pulsator.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"


using namespace c74::min;
using namespace serialist;


class ser_phasepulse : public c74::min::object<ser_phasepulse> {
private:
    PhasePulsatorWrapper<double> m_pulse;

public:
    MIN_DESCRIPTION{"Phasor-based pulse generator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.pulse, ser.oscillator"};

    inlet<> inlet_main{this, "(float/list) cursor position / control messages", "", true};
    inlet<> inlet_legato{this, "(float/list) legato amount", "", false};
    inlet<> inlet_durations{this, "(float/list) list of durations", "", false};

    outlet<> outlet_main{this, "(int/list) pulses"};
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
                if (AttributeSetters::try_set_value(args, m_pulse.enabled, cerr))
                    return args;
                return enabled;
            }}
    };

    attribute<int> voices{this, Keywords::NUM_VOICES
                          , 0
                          , title{Titles::NUM_VOICES}
                          , description{Descriptions::ENABLED}
                          , setter{MIN_FUNCTION {
                if (AttributeSetters::try_set_value(args, m_pulse.num_voices, cerr))
                    return args;
                return voices;
            }}
    };


    attribute<std::vector<double>> legato{this, "legato"
                                          , Vec<double>::singular(PhasePulsator::DEFAULT_LEGATO).vector()
                                          , title{"legato"}
                                          , setter{MIN_FUNCTION {
                if (AttributeSetters::try_set_vector(args, m_pulse.legato_amount, cerr))
                    return args;
                return legato;
            }}
    };


    // Note: As long as there's no meaningful GUI object for handling multiple layers of durations
    //       (which there is unlikely to ever be), durations should indeed be a single Voice rather than a Voices.
    //       If we need multiple sequences of durations synced to a single waveform, just use multiple ser.phasepulse.
    attribute<std::vector<double>> durations{ this, "durations", {0.0}, setter{
            MIN_FUNCTION {
                if (AttributeSetters::try_set_vector(args, m_pulse.duration, cerr)) {
                    return args;
                }
                
                cerr << "bad argument for message \"durations\"" << endl;
                return durations;
            }
        }
    };


    message<> flush{this, Keywords::FLUSH
                    , description{Descriptions::FLUSH}
                    , MIN_FUNCTION {
                if (inlet != 0) {
                    return {};
                }

                cwarn << "flush not implemented yet" << endl;
                return {};
            }
    };

    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            durations.set(args);
        } else if (inlet == 1) {
            legato.set(args);
        } else {
            process(args);
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
        if (auto cursor = AtomParser::atoms2vec<double>(args)) {
            m_pulse.cursor.set_values(Voices<double>::transposed(*cursor));

            auto time = MaxTimePoint::get_time_point_of(clock.get());
            if (!time) {
                cerr << *time.err() << endl;
                return;
            }

            m_pulse.pulsator_node.update_time(*time);

            auto outgoing_triggers = m_pulse.pulsator_node.process();

            TriggerStereotypes::output_as_triggers_sorted(outgoing_triggers, outlet_main, cerr);

        } else {
            cerr << cursor.err().message() << endl;
            return;
        }
    }

};


MIN_EXTERNAL(ser_phasepulse);