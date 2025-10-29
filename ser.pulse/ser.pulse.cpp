#include <serialist_transport.h>
#include <core/policies/policies.h>

#include <core/generatives/phase_pulsator.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "attribute_setters.h"
#include "message_stereotypes.h"


using namespace c74::min;
using namespace serialist;


class ser_pulse : public object<ser_pulse>
                  , public SerialistTransport::Listener {
    PhasePulsatorWrapper<> m_pulse;

public:
    MIN_DESCRIPTION{"Phase-based pulse generator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phase, ser.phasemap"};

    inlet<> inlet_main{this, Inlets::voice(Types::phase, "Incoming phase")};
    inlet<> inlet_legato{this, Inlets::voice(Types::number, "Legato amount"), "", false};

    outlet<> outlet_main{this, Inlets::voice(Types::pulse, "Generated pulses")};
    outlet<> dumpout{this, Inlets::DUMPOUT};


    explicit ser_pulse(const atom& args = {}) {
        SerialistTransport::get_instance().add_listener(*this);
    }

    ~ser_pulse() override {
        SerialistTransport::get_instance().remove_listener(*this);
    }


    void on_transport_state_change(bool active) override {
        if (!detach.get() && !active) {
            flush_internal();
        }
    }


    SER_NUM_VOICES_ATTRIBUTE(m_pulse.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();


    // Expanded version SER_ENABLED_ATTRIBUTE to handle flushing on disabling
    attribute<bool> enabled{ this, "enabled", true, Titles::ENABLED, Descriptions::ENABLED, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<bool>(args)) {
                    m_pulse.enabled.set_values(*v);
                    if (!*v) {
                        flush_internal();
                    }
                    return args;

                } else {
                    cerr << v.err().message() << endl;
                    return enabled;
                }
            }
        }
    };


    // Expanded version SER_DETACH_ATTRIBUTE to handle flushing
    attribute<bool> detach{this, "detach", false, Descriptions::DETACH_DESCRIPTION, setter{
        MIN_FUNCTION {
            if (auto new_value = AtomParser::atoms2value<bool>(args)) {
                if (*new_value != detach.get() && !*new_value && !SerialistTransport::get_instance().active()) {
                    flush_internal();
                }
                return args;
            }
            cerr << "bad argument for message \"detach\"" << endl;
            return detach;
        }
    }};


    vector_attribute<double> legato{this, "legato", m_pulse.legato_amount, PhasePulsatorParameters::DEFAULT_LEGATO, cerr};

    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> legato;
    });


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << legato;
    });


    message<threadsafe::no> flush{this, AttributeNames::FLUSH
                    , description{Descriptions::FLUSH}
                    , MIN_FUNCTION {
                if (inlet != 0) {
                    return {};
                }

                flush_internal();
                return {};
            }
    };

    function handle_input = MIN_FUNCTION {
        if (inlet == 1) {
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

            auto time = SerialistTransport::get_instance().get_time();
            SerialistTransport::apply_detach(time, detach.get());

            if (!time.get_transport_running()) {
                return;
            }

            m_pulse.pulsator_node.update_time(time);

            auto outgoing_triggers = m_pulse.pulsator_node.process();

            TriggerStereotypes::output_as_triggers_sorted(outgoing_triggers, outlet_main, cerr);

        } else {
            cerr << cursor.err().message() << endl;
        }
    }


    void flush_internal() {
        // We're not using the `flush` Trigger of the PhasePulsator here, since `process` is only called when
        // it receives a cursor value, which may not be the case
        // (cursor disconnected, transport not running, etc.)

        if (auto flushed = m_pulse.pulsator_node.flush(); !flushed.is_empty_like()) {
            TriggerStereotypes::output_as_triggers_sorted(flushed, outlet_main, cerr);
        }
    }

};


MIN_EXTERNAL(ser_pulse);