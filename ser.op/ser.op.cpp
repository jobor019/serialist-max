#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "core/generatives/operator.h"


using namespace c74::min;

class op : public object<op> {
private:
    OperatorWrapper<double> m_op;
    bool m_lhs_is_hot = true;
    bool m_rhs_is_hot = false;

    c74::min::message_type m_output_type = c74::min::message_type::float_argument;

public:
    MIN_DESCRIPTION{"Multi-channel unary and binary operators"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.oscillator"};

    inlet<> inlet_lhs{this, "left operand", "float/listoflists", [this]() { return lhs_is_hot(); }};
    inlet<> inlet_rhs{this, "right operand", "float/listoflists", [this]() { return rhs_is_hot(); }};
    outlet<> outlet_main{this, "result", "float/listoflists"};
    outlet<> dumpout{this, "(any) dumpout"};

    static const inline std::string CLASS_NAME = "ser.op";

    explicit op(const atoms& args = {}) {
        if (args.empty()) {
            error(ErrorMessages::missing_argument(CLASS_NAME, "<operator> [inital_value]"));
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
            if (auto rhs = AtomParser::atom2value<double>(args[1])) {
                m_op.rhs.set_values(*rhs);
            } else {
                error(CLASS_NAME + ": the second argument must be a number");
            }
        }

        if (args.size() > 2) {
            // TODO: Not sure if this->classname() is defined at this point!!!
            cwarn << ErrorMessages::extra_argument(CLASS_NAME) << endl;
        }
    }

    attribute<std::vector<int>> triggers{this
                                         , Keywords::TRIGGERS
                                         , {0}
                                         , title{Titles::TRIGGERS}
                                         , setter{MIN_FUNCTION {
                auto v = AtomParser::atoms2vec<int>(args);
                if (v) {
                    m_lhs_is_hot = v->contains(0);
                    m_rhs_is_hot = v->contains(1);
                    return args;
                } else {
                    cerr << v.err() << endl;
                    return triggers;
                }
            }}};

    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 0) {
            if (AttributeSetters::try_set_voices<double>(args, m_op.lhs, cerr)) {
                if (lhs_is_hot()) {
                    process();
                }
            }
        } else if (inlet == 1) {
            if (AttributeSetters::try_set_voices<double>(args, m_op.rhs, cerr)) {
                if (rhs_is_hot()) {
                    process();
                }
            }
        }
        return {};
    };

    attribute<int> voices{this
                          , Keywords::NUM_VOICES
                          , 0
                          , title{Titles::NUM_VOICES}
                          , setter{MIN_FUNCTION {
                if (AttributeSetters::try_set_value<std::size_t, int>(args, m_op.num_voices, cerr)) {
                    return args;
                }
                return voices;
            }}
    };

    attribute<symbol> type{this
                           , Keywords::TYPE_SPEC
                           , "float"
                           , title{Titles::TYPE_SPEC}
                           , description{Descriptions::TYPE_SPEC}
                           , setter{MIN_FUNCTION {
                if (auto type_spec = TypeSpecificationStereotypes::atoms2type_specification(args)) {
                    m_output_type = *type_spec;
                    return args;
                } else {
                    error(ErrorMessages::format(*type_spec.err(), CLASS_NAME));
                }
                return type;
            }}
    };

    message<> bang{this, "bang", MIN_FUNCTION {
        process();
        return {};
    }};

    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void process() {
        m_op.operator_node.update_time(TimePoint());
        auto output = m_op.operator_node.process();
        c74::min::atoms formatted_atoms;
        if (m_output_type == c74::min::message_type::int_argument) {
            formatted_atoms = AtomFormatter::voices2atoms<long>(output);
        } else if (m_output_type == c74::min::message_type::float_argument) {
            formatted_atoms = AtomFormatter::voices2atoms<double>(output);
        } else {
            formatted_atoms = AtomFormatter::voices2atoms<std::string>(
                    output.as_type<std::string>([](const Facet& v) {
                        return std::to_string(static_cast<long>(v));
                    }));
        }
        outlet_main.send(formatted_atoms);
    }

    bool lhs_is_hot() const {
        return m_lhs_is_hot;
    }

    bool rhs_is_hot() const {
        return m_rhs_is_hot;
    }

};


MIN_EXTERNAL(op);