#include <serialist_transport.h>
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

    inlet<> inlet_main{this, "(any) trigger", };
    inlet<> inlet_note{this, "(int/list/listoflists) note number", "", false};
    inlet<> inlet_velocity{this, "(int/list/listoflists) velocity", "", false};
    inlet<> inlet_channel{this, "(int/list/listoflists) channel", "", false};

    outlet<> outlet_main{this, "(list) note_number velocity channel"};
    outlet<> dumpout{this, "(any) dumpout"};


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

    // Note: note/velocity/channel are messages rather than attributes since we need to support lists of lists

    message<> note{this, "note", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"note\" for inlet " << inlet << endl;
            return {};
        }

        this->set_note_number(args);
        return {};
    }}};

    message<> velocity{this, "velocity", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"velocity\" for inlet " << inlet << endl;
            return {};
        }

        this->set_velocity(args);
        return {};
    }}};

    message<> channel{this, "channel", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"channel\" for inlet " << inlet << endl;
            return {};
        }

        this->set_channel(args);
        return {};
    }}};


    function handle_input = MIN_FUNCTION {
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

                auto flushed = m_make_note.make_note_node.flush();
                EventStereotypes::output_as_events(flushed, outlet_main, std::nullopt, cerr);
                return {};
            }
    };

    // Note: we're NOT supporting bang as an argument as there would be no note_off associated with such a trigger
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

        auto time = SerialistTransport::get_instance().get_time();

        m_make_note.trigger.set_values(*triggers);
        m_make_note.make_note_node.update_time(time);
        auto note_events = m_make_note.make_note_node.process();
        m_make_note.trigger.set_values(Voices<Trigger>::empty_like());


        EventStereotypes::output_as_events(note_events, outlet_main, std::nullopt, cerr);
    }


    bool set_note_number(const atoms& args) {
        return AttributeSetters::try_set_voices(args, m_make_note.note_number, cerr);
    }


    bool set_velocity(const atoms& args) {
        // Even if we only support one duration per voice internally, it's important that we allow using
        // Voices here since that's the only way to provide a null-value (pause) in a particular voice
        return AttributeSetters::try_set_voices(args, m_make_note.velocity, cerr);
    }


    bool set_channel(const atoms& args) {
        return AttributeSetters::try_set_voices(args, m_make_note.channel, cerr);
    }


    bool set_enabled(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_make_note.enabled, cerr);
    }


    bool set_num_voices(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_make_note.num_voices, cerr);
    }
};


MIN_EXTERNAL(ser_makenote);