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


class ser_index : public object<ser_index> {
private:
    IndexWrapper<> m_index;

    static const inline auto STEPS_DESCR = Inlets::voice(Types::index, "Set number of steps");
    static const inline auto STRIDE_DESCR = Inlets::voice(Types::number, "Set stride");
    static const inline auto RESET_DESCR = Inlets::voice(Types::pulse, "Reset index on next trigger");

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
    outlet<> dumpout{this, Inlets::DUMPOUT};

    argument<atoms> steps_arg{this, "steps", "Set number of steps"};

    explicit ser_index(const atoms& args = {}) {
        if (!args.empty()) {
            steps.set(args);
        }
    }

    SER_ENABLED_ATTRIBUTE(m_index.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_index.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();


    vector_attribute<std::size_t, int> steps{this, "steps", m_index.num_steps
        , IndexHandler::DEFAULT_NUM_STEPS, cerr, "", nullptr, STEPS_DESCR};


    vector_attribute<double> stride{this, "stride", m_index.stride
        , IndexHandler::DEFAULT_STRIDE, cerr, "", nullptr, STRIDE_DESCR};


    value_attribute<bool> autoreset{this, "autoreset", m_index.reset_on_change
        , IndexHandler::DEFAULT_RESET, cerr, "", nullptr, description{"Reset index every time steps changes"}};


    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> steps >> stride >> autoreset;
    });


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << steps << stride << autoreset;
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
        if (!SerialistTransport::get_instance().active()) {
            return;
        }

        auto& trigger = m_index.trigger;

        if (args.empty()) {
            // bang received: trigger all voices
            trigger.set_values(Voices<Trigger>::singular(Trigger::pulse_on()));
        } else {
            auto triggers = AtomParser::atoms2triggers(args, false);

            if (!triggers || triggers->is_empty_like()) {
                return;
            }

            trigger.set_values(*triggers);
        }

        auto& node = m_index.index_node;

        node.update_time(SerialistTransport::get_instance().get_time());
        auto output = node.process();

        trigger.set_values(Voices<Trigger>::empty_like());
        m_index.reset.set_values(Voices<Trigger>::empty_like());

        auto formatted_atoms = AtomFormatter::voices2atoms<std::size_t>(output);
        outlet_main.send(formatted_atoms);
    }

};


MIN_EXTERNAL(ser_index);