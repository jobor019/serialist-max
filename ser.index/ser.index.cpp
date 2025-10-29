#include <core/policies/policies.h>
#include <core/generatives/index_node.h>

#include "c74_min.h"
#include "inlet_triggers.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"
#include "serialist_transport.h"

using namespace c74::min;
using namespace serialist;


class ser_index : public object<ser_index>
                  , public SerialistTransport::Listener {
private:

    enum class AutoResetMode : uint8_t { none, steps, transport, both };

    IndexWrapper<> m_index;

    static const inline auto STEPS_DESCR = Inlets::voice(Types::index, "Set number of steps");
    static const inline auto STRIDE_DESCR = Inlets::voice(Types::number, "Set stride");
    static const inline auto RESET_DESCR = Inlets::voice(Types::pulse, "Reset index on next trigger");
    static const inline description AUTO_RESET_DESCR{"Automatically reset the index: "
                                                     "0 (no reset, default), "
                                                     "1 (reset on change in number of steps), "
                                                     "2 (reset on transport activation), "
                                                     "3 (reset on both)"};

    static constexpr std::size_t TRIGGER_INLET = 0;
    static constexpr std::size_t STEPS_INLET = 1;
    static constexpr std::size_t STRIDE_INLET = 2;
    static constexpr std::size_t RESET_INLET = 3;

public:
    MIN_DESCRIPTION{"Multi-channel index generator"};
    MIN_TAGS{""};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phase, ser.pulse, ser.interpolate"};

    inlet<> inlet_main{this, Inlets::trigger_info("Trigger next index")};
    inlet<> inlet_steps{this, STEPS_DESCR, "", false};
    inlet<> inlet_stride{this, STRIDE_DESCR, "", false};
    inlet<> inlet_reset{this, RESET_DESCR, "", false};

    outlet<> outlet_main{this, Inlets::voice(Types::index, "Next index")};
    outlet<> outlet_phase{this, Inlets::voice(Types::phase, "Normalized position")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    argument<atoms> steps_arg{this, "steps", "Set number of steps"};


    explicit ser_index(const atoms& args = {}) {
        if (!args.empty()) {
            steps.set(args);
        }

        SerialistTransport::get_instance().add_listener(*this);
    }


    ~ser_index() override {
        SerialistTransport::get_instance().remove_listener(*this);
    }


    void on_transport_state_change(bool active) override {
        if (autoreset.get() == AutoResetMode::transport || autoreset.get() == AutoResetMode::both) {
            assert(c74::max::systhread_ismainthread());
            reset();
        }
    }


    SER_ENABLED_ATTRIBUTE(m_index.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_index.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();
    SER_DETACH_ATTRIBUTE_STATELESS();


    vector_attribute<std::size_t, int> steps{this, "steps", m_index.num_steps
        , IndexHandler::DEFAULT_NUM_STEPS, cerr, "", nullptr, STEPS_DESCR};


    vector_attribute<double> stride{this, "stride", m_index.stride
        , IndexHandler::DEFAULT_STRIDE, cerr, "", nullptr, STRIDE_DESCR};



    attribute<AutoResetMode> autoreset{ this, "autoreset", AutoResetMode::none, AUTO_RESET_DESCR, setter{
            MIN_FUNCTION {
                if (args.size() == 1 && args[0].type() == message_type::int_argument) {
                    auto v = static_cast<AutoResetMode>(args[0]);
                    m_index.reset_on_change.set_value(v == AutoResetMode::steps || v == AutoResetMode::both);
					return args;
				}

                cerr << "bad argument for message \"autoreset\"" << endl;
                return autoreset;
            }
        }
    };

    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> steps >> stride >> autoreset >> detach;
    });


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << steps << stride << autoreset << detach;
    });


    message<threadsafe::no> reset{this, "reset", RESET_DESCR, setter{MIN_FUNCTION {
        set_reset_triggers(args);
        return {};
    }}};


    function handle_input = MIN_FUNCTION {
        if (inlet == RESET_INLET) {
            set_reset_triggers(args);
        } else if (inlet == STRIDE_INLET) {
            stride.set(args);
        } else if (inlet == STEPS_INLET) {
            steps.set(args);
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
    void set_reset_triggers(const atoms& args) {
        if (args.empty()) {
            // bang received: reset all voices
            m_index.reset.set_values(Voices<Trigger>::singular(Trigger::pulse_on()));
            return;
        }

        if (auto v = AtomParser::atoms2triggers(args)) {
            m_index.reset.set_values(*v);
        } else {
            cerr << v.err().message() << endl;
        }
    }


    void process(const atoms& args) {
        auto& trigger = m_index.trigger;

        if (args.empty()) {
            // bang received: trigger all voices
            trigger.set_values(Voices<Trigger>::singular(Trigger::pulse_on()));
        } else {
            auto triggers = AtomParser::atoms2triggers(args, false);

            if (!triggers || !Trigger::contains_pulse_on(*triggers)) {
                return;
            }

            trigger.set_values(*triggers);
        }

        auto time = SerialistTransport::get_instance().get_time();
        SerialistTransport::apply_detach(time, detach.get());

        if (!time.get_transport_running()) {
            return;
        }

        auto& node = m_index.index_node;
        node.update_time(time);

        auto output = node.process();

        trigger.set_values(Voices<Trigger>::empty_like());
        m_index.reset.set_values(Voices<Trigger>::empty_like());

        output_normalized_position(output);

        auto formatted_atoms = AtomFormatter::voices2atoms<std::size_t>(output);
        outlet_main.send(formatted_atoms);
    }


    void output_normalized_position(const Voices<Facet>& output) {
        if (output.is_empty_like()) {
            return;
        }

        auto num_voices = output.size();

        auto num_steps = m_index.num_steps.get_values()
                .adapted_to(num_voices)
                .firsts_or(IndexHandler::UNBOUNDED);

        auto current = output.firsts_or<double>(0);

        Vec<atom> normalized_position = Vec<atom>::allocated(num_voices);
        for (std::size_t i = 0; i < num_voices; ++i) {
            normalized_position.append(current[i] / static_cast<double>(IndexHandler::parse(num_steps[i])));
        }

        outlet_phase.send(normalized_position.vector());
    }

};


MIN_EXTERNAL(ser_index);