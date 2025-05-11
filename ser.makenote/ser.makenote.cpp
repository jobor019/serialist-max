#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/make_note.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"


using namespace c74::min;

class ser_makenote : public object<ser_makenote> {
private:
    std::mutex m_mutex;
    MakeNoteWrapper m_make_note;

    static const inline auto NN_DESCRIPTION = Inlets::voices(Types::number, "Set note numbers");
    static const inline auto VEL_DESCRIPTION = Inlets::voices(Types::number, "Set velocities");
    static const inline auto CH_DESCRIPTION = Inlets::voices(Types::number, "Set channels");

    static const inline auto CLASS_NAME = "ser.makenote";

public:
    MIN_DESCRIPTION{""};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"makenote, noteout"};

    inlet<> inlet_main{this, Inlets::pulse_info("generate note on/off from pulse on/off")};
    inlet<> inlet_note{this, NN_DESCRIPTION, "", false};
    inlet<> inlet_velocity{this, VEL_DESCRIPTION, "", false};
    inlet<> inlet_channel{this, CH_DESCRIPTION, "", false};

    outlet<> outlet_main{this, "(list) note_number velocity channel"};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    argument<atoms> note_arg{this, "note", "same as \"note\" message (accepts only a single note number)"};
    argument<atoms> velocity_arg{this, "velocity", "same as \"velocity\" message (accepts only a single velocity)"};
    argument<atoms> channel_arg{this, "channel", "same as \"channel\" message (accepts only a single channel)"};


    explicit ser_makenote(const atoms& args = {}) {
        if (args.size() > 3) {
            cwarn << ErrorMessages::extra_argument(CLASS_NAME) << endl;
        }
        if (args.size() > 2) {
            channel.set(atoms{args[2]});
        }
        if (args.size() > 1) {
            velocity.set(atoms{args[1]});
        }
        if (!args.empty()) {
            note.set(atoms{args[0]});
        }

        metro.delay(500);
    }

    timer<> metro{this, MIN_FUNCTION {
        if (!SerialistTransport::get_instance().active() || !m_make_note.enabled.get_values().first_or(true)) {
            flush_internal();
        }

        metro.delay(500);
        return {};
    }};

    SER_ENABLED_ATTRIBUTE(m_make_note.enabled, &m_mutex);
    SER_NUM_VOICES_ATTRIBUTE(m_make_note.num_voices, &m_mutex);
    SER_AUTO_RESTORE_ATTRIBUTE();

    pseudo_attribute<NoteNumber> note{this, "note", m_make_note.note_number, cerr
        , NN_DESCRIPTION
        , input_format::voices , &m_mutex};

    pseudo_attribute<uint32_t> velocity{this, "velocity", m_make_note.velocity, cerr
        , VEL_DESCRIPTION
        , input_format::voices , &m_mutex};

    pseudo_attribute<uint32_t> channel{this, "channel", m_make_note.channel, cerr
        , CH_DESCRIPTION
        , input_format::voices , &m_mutex};


    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> note >> velocity >> channel;
    });

    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << note << velocity << channel;
    });


    function handle_input = MIN_FUNCTION {
        if (inlet == 3) {
            channel.set(args);
        } else if (inlet == 2) {
            velocity.set(args);
        } else if (inlet == 1) {
            note.set(args);
        } else {
            this->process_trigger(args);
        }

        return {};
    };


    message<threadsafe::no> flush{
            this, AttributeNames::FLUSH, Descriptions::FLUSH, MIN_FUNCTION {
                if (inlet != 0) {
                    return {};
                }
                flush_internal();
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

        // CRITICAL SECTION

        std::unique_lock lock{m_mutex};
        auto note_events = m_make_note.make_note_node.process();
        lock.unlock();

        // CRITICAL SECTION END

        m_make_note.trigger.set_values(Voices<Trigger>::empty_like());

        EventStereotypes::output_as_events(note_events, outlet_main, std::nullopt, cerr);
    }

    void flush_internal() {
        std::lock_guard lock{m_mutex};
        auto flushed = m_make_note.make_note_node.flush();
        EventStereotypes::output_as_events(flushed, outlet_main, std::nullopt, cerr);
    }
};


MIN_EXTERNAL(ser_makenote);