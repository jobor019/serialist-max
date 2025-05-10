#include <core/policies/policies.h>
#include <core/generatives/operator.h>

#include "c74_min.h"
#include "attribute_setters.h"
#include "inlet_triggers.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"


using namespace c74::min;
using namespace serialist;

class ser_op : public object<ser_op> {
private:
    OperatorWrapper<> m_op;
    InletTriggerHandler m_inlet_triggers{true, false};

    static const inline auto LHS_DESCRIPTION = Inlets::voices(Types::number, "Left operand");
    static const inline auto RHS_DESCRIPTION = Inlets::voices(Types::number, "Right operand");

public:
    MIN_DESCRIPTION{"Multi-channel unary and binary operators"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phase"};

    inlet<> inlet_lhs{this, LHS_DESCRIPTION, "", [this]() { return lhs_is_hot(); }};
    inlet<> inlet_rhs{this, RHS_DESCRIPTION, "", [this]() { return rhs_is_hot(); }};
    outlet<> outlet_main{this, Inlets::voices(Types::number, "Operation result")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    static const inline std::string CLASS_NAME = "ser.op";

    // Only for documentation, type is not restrictive
    argument<atoms> mode_arg{this, "mode", "Mode of operation"}; // TODO: List valid values
    argument<atoms> rhs_arg{this, "rhs", "Set initial right operand"};

    explicit ser_op(const atoms& args = {}) {
        if (args.empty()) {
            error(ErrorMessages::missing_argument(CLASS_NAME, "<operator> [initial_value(s)]"));

        } else {
            if (auto mode_str = AtomParser::atom2value<std::string>(args[0])) {
                try {
                    auto mode = Operator::from_string(*mode_str);
                    m_op.type.set_values(mode);
                } catch (std::domain_error&) {
                    error(CLASS_NAME + ": invalid operator: " + static_cast<std::string>(args[0]));
                }
            } else {
                error(CLASS_NAME + ": the first argument must be a symbol");
            }
        }

        if (args.size() >= 2) {
            atoms values;
            values.insert(values.end(), args.begin() + 1, args.end());
            rhs.set(values);
        }
    }

    SER_ENABLED_ATTRIBUTE(m_op.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_op.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();

    attribute<std::vector<int>> triggers{this
                                         , AttributeNames::TRIGGERS
                                         , {0}
                                         , Titles::TRIGGERS
                                         , Descriptions::INLET_TRIGGERS
                                         , setter{MIN_FUNCTION {
                if (m_inlet_triggers.try_set_triggers_from_index_list(args, cerr)) {
                    return args;
                }
                return triggers;
    }}};


    pseudo_attribute<double> lhs{this, "lhs", m_op.lhs, cerr
        , LHS_DESCRIPTION
        , input_format::voices, nullptr, [this] { process_if(lhs_is_hot()); }};


    pseudo_attribute<double> rhs{this, "rhs", m_op.rhs, cerr
        , RHS_DESCRIPTION
        , input_format::voices, nullptr, [this] { process_if(rhs_is_hot()); }};


    message<> setup{this, "setup", setter{MIN_FUNCTION {
        LoadState s{state()};
        s >> enabled >> voices >> triggers >> lhs >> rhs;

        return {};
    }}};


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << triggers << lhs << rhs;
    });


    function handle_input = MIN_FUNCTION {
        if (inlet == 1) {
            rhs.set(args);
        } else if (inlet == 0) {
            lhs.set(args);
        }
        return {};
    };


    message<> bang{this, "bang", description{"Trigger last operation again"}, MIN_FUNCTION {
        process();
        return {};
    }};

    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void process_if(bool check) {
        if (check)
            process();
    }


    void process() {
        m_op.operator_node.update_time(TimePoint());
        auto output = m_op.operator_node.process();
        outlet_main.send(AtomFormatter::voices2atoms<double>(output));
    }

    bool lhs_is_hot() const { return m_inlet_triggers.is_hot(0); }
    bool rhs_is_hot() const { return m_inlet_triggers.is_hot(1); }

};


MIN_EXTERNAL(ser_op)