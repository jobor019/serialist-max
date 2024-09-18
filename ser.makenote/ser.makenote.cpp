#include <core/policies/policies.h>
#include <core/generatives/make_note.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"


using namespace c74::min;

class ser_makenote : public object<ser_makenote> {
private:
    MakeNoteWrapper m_make_note;

public:
    static inline const std::string CLASS_NAME = "makenote";

    MIN_DESCRIPTION{""};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{""};

    inlet<> inlet_main{this, "(any) control messages / trigger)", "float/listoflists"};
    inlet<> inlet_note{this, "(int/list) note number", "int/listoflists", false};
    inlet<> inlet_velocity{this, "(int/list) velocity", "int/listoflists", false};
    inlet<> inlet_channel{this, "(int/list) channel", "int/listoflists", false};

    outlet<> outlet_main{this, "(list) note_number velocity channel"};
    outlet<> dumpout{this, "(any) dumpout"};

    attribute<symbol> clock{this, Keywords::CLOCK, "", title{Titles::CLOCK}, description{Descriptions::CLOCK}};


    attribute<bool> enabled{
            this, Keywords::ENABLED, true, title{Titles::ENABLED}, description{Descriptions::ENABLED}, setter{
                    MIN_FUNCTION {
                        if (this->set_enabled(args))
                            return args;
                        return enabled;
                    }
            }
    };


    attribute<int> voices{
            this, Keywords::NUM_VOICES, 0, title{Titles::NUM_VOICES}, description{Descriptions::ENABLED}, setter{
                    MIN_FUNCTION {
                        if (this->set_num_voices(args))
                            return args;
                        return voices;
                    }
            }
    };

    attribute<std::vector<int> > note{
            this, "note", Vec<int>::singular(60).vector(), title{"note"}, setter{
                    MIN_FUNCTION {
                        if (this->set_note_number(args))
                            return args;
                        return note;
                    }
            }
    };

    attribute<std::vector<int> > velocity{
            this, "velocity", Vec<int>::singular(100).vector(), title{"velocity"}, setter{
                    MIN_FUNCTION {
                        if (this->set_velocity(args))
                            return args;
                        return velocity;
                    }
            }
    };

    attribute<std::vector<int> > channel{
            this, "channel", Vec<int>::singular(1).vector(), title{"channel"}, setter{
                    MIN_FUNCTION {
                        if (this->set_channel(args))
                            return args;
                        return channel;
                    }
            }
    };


    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 3) {
            this->set_channel(args);
        } else if (inlet == 2) {
            this->set_velocity(args);
        } else if (inlet == 1) {
            this->set_note_number(args);
        } else {
            this->process_trigger(args);
        }

        return {};
    };


    message<> flush{
            this, Keywords::FLUSH, description{Descriptions::FLUSH}, MIN_FUNCTION {
                if (inlet != 0) {
                    return {};
                }

                cwarn << "flush not implemented yet" << endl;
                return {};
            }
    };

    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void process_trigger(const atoms& atms) {
        auto triggers = AtomParser::atoms2triggers(atms, false);

        if (!triggers || triggers->is_empty_like()) {
            return;
        }

        auto time = MaxTimePoint::get_time_point_of(clock.get());
        if (!time) {
            cerr << *time.err() << endl;
            return;
        }

        m_make_note.trigger.set_values(*triggers);
        m_make_note.make_note_node.update_time(*time);
        auto note_events = m_make_note.make_note_node.process();
        m_make_note.trigger.set_values(Voices<Trigger>::empty_like());


        EventStereotypes::output_as_events(note_events, outlet_main, std::nullopt, cerr);
    }


    bool set_note_number(const atoms& args) {
        return AttributeSetters::try_set_voices(args, m_make_note.note_number, cerr);
    }


    bool set_velocity(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_make_note.velocity, cerr);
    }


    bool set_channel(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_make_note.channel, cerr);
    }


    bool set_enabled(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_make_note.enabled, cerr);
    }


    bool set_num_voices(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_make_note.num_voices, cerr);
    }
};


MIN_EXTERNAL(ser_makenote);