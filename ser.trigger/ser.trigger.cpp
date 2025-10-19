#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/trigger_node.h>

#include "c74_min.h"
#include "inlet_triggers.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "message_stereotypes.h"


using namespace c74::min;

class ser_trigger : public object<ser_trigger> {

    static const inline auto VALUES_DESCRIPTION = Inlets::voices(Types::number, "Set values to trigger");
    static const inline auto TARGETLIST_DESCRIPTION = Inlets::value(Types::boolean, "Format output for mc~ compatibility");

    static constexpr std::size_t TRIGGER_INLET = 0;
    static constexpr std::size_t VALUE_INLET = 1;

    TriggerNodeWrapper<> m_internal_interpolator;

    InletTriggerHandler m_inlet_triggers{true, false};

public:
    MIN_DESCRIPTION{"Utility for triggering individual values in a (multi)list"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.router, mc.targetlist"};

    inlet<> inlet_main{this, Inlets::trigger_info("Trigger output"), "", [this] { return is_hot(TRIGGER_INLET); }};
    inlet<> inlet_chord{this, VALUES_DESCRIPTION, "", [this] { return is_hot(VALUE_INLET); }};

    outlet<> outlet_main{this, Inlets::voices(Types::number, "output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};


    SER_ENABLED_ATTRIBUTE(m_internal_interpolator.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_internal_interpolator.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();

    attribute<bool> m_targetlist{ this, "targetlist", false};

    attribute<std::vector<int>> m_triggers{this
                                      , AttributeNames::TRIGGERS
                                      , {0}
        , Titles::TRIGGERS
        , Descriptions::INLET_TRIGGERS
        , setter{MIN_FUNCTION {
            if (m_inlet_triggers.try_set_triggers_from_index_list(args, cerr)) {
                return args;
            }
            return m_triggers;
        }}};



    pseudo_attribute<double> m_values{this, "values", m_internal_interpolator.value, cerr, VALUES_DESCRIPTION
        , input_format::voices, nullptr, [this] {
            if (is_hot(VALUE_INLET)) {
                process(InletTriggerHandler::triggers_like(m_internal_interpolator.value.get_values()));
            }

        }};


    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> m_triggers>> m_values;
    });

    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << m_triggers << m_values;
    });

    function handle_input = MIN_FUNCTION {
        if (inlet == VALUE_INLET) {
            m_values.set(args);
        } else if (is_hot(TRIGGER_INLET)) {
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
    void process(const atoms& atms) {
        if (atms.empty()) {
            // bang received: trigger all voices
            process(Voices<Trigger>::singular(Trigger::pulse_on()));
        } else {
            auto triggers = AtomParser::atoms2triggers(atms, false);

            if (!triggers || !Trigger::contains_pulse_on(*triggers)) {
                return;
            }

            process(*triggers);
        }
    }


    void process(const Voices<Trigger>& triggers) {
        auto& trigger = m_internal_interpolator.trigger;
        trigger.set_values(triggers);

        auto& node = m_internal_interpolator.trigger_node;
        node.update_time(SerialistTransport::get_instance().get_time());
        auto output = node.process();

        auto used_triggers = trigger.get_values().adapted_to(output.size());

        trigger.set_values(Voices<Trigger>::empty_like());

        handle_output(output, used_triggers);
    }


    bool is_hot(std::size_t i) const {
        return m_inlet_triggers.is_hot(i);
    }

    void handle_output(const Voices<Facet>& voices_to_output, const Voices<Trigger>& triggers) {
        if (!m_targetlist.get()) {
            auto formatted_atoms = AtomFormatter::voices2atoms<double>(voices_to_output);
            outlet_main.send(formatted_atoms);
        } else {
            assert(triggers.size() == voices_to_output.size());

            for (std::size_t i = 0; i < voices_to_output.size(); ++i) {
                if  (Trigger::contains_pulse_on(triggers[i]) && !voices_to_output[i].empty()) {
                    atoms formatted_atoms{"setvalue", i + 1};
                    for (const auto& v : voices_to_output[i]) {
                        formatted_atoms.emplace_back(static_cast<double>(v));
                    }
                    outlet_main.send(formatted_atoms);
                }
            }
        }
    }
};




MIN_EXTERNAL(ser_trigger);