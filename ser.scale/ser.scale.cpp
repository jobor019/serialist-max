#include <core/policies/policies.h>
#include <core/generatives/scaler.h>

#include "c74_min.h"
#include "inlet_triggers.h"
#include "max_stereotypes.h"
#include "message_stereotypes.h"

using namespace c74::min;


class ser_scale : public object<ser_scale> {

    static const inline auto INPUT_RANGE_DESCRIPTION = Inlets::voices(Types::number, "Input range (default: 0 1)");
    static const inline auto OUTPUT_RANGE_DESCRIPTION = Inlets::voices(Types::number, "Output range (default: 0 1)");

    static constexpr std::size_t VALUE_INLET = 0;
    static constexpr std::size_t OUTPUT_RANGE_INLET = 1;

    ScalerWrapper<> m_scaler;

    InletTriggerHandler m_inlet_triggers{true, false};

public:
    MIN_DESCRIPTION{""};                   // TODO
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.op"};

    inlet<> inlet_main{this, Inlets::voices(Types::number, "Input to map"), "", [this] { return is_hot(VALUE_INLET); }};
    inlet<> inlet_output_range{this, OUTPUT_RANGE_DESCRIPTION, "", [this] { return is_hot(OUTPUT_RANGE_INLET); }};

    outlet<> outlet_main{this, "Mapped value"};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    attribute<atoms> input{ this, "input", {Scaler::DEFAULT_INPUT_LOW, Scaler::DEFAULT_INPUT_HIGH}, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2ranges<double>(args, Scaler::DEFAULT_INPUT_LOW, Scaler::DEFAULT_INPUT_HIGH)) {
                    m_scaler.input_low.set_values(Voices<double>::transposed(std::get<0>(*v)));
                    m_scaler.input_high.set_values(Voices<double>::transposed(std::get<1>(*v)));
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                }
                return input;
            }
        }
    };


    attribute<atoms> output{ this, "output", {Scaler::DEFAULT_OUTPUT_LOW, Scaler::DEFAULT_OUTPUT_HIGH}, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2ranges<double>(args, Scaler::DEFAULT_OUTPUT_LOW, Scaler::DEFAULT_OUTPUT_HIGH)) {
                    m_scaler.output_low.set_values(Voices<double>::transposed(std::get<0>(*v)));
                    m_scaler.output_high.set_values(Voices<double>::transposed(std::get<1>(*v)));
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                }
                return output;
            }
        }
    };


    attribute<std::vector<int>> triggers{this, AttributeNames::TRIGGERS, {VALUE_INLET}
                                        , Titles::TRIGGERS, Descriptions::INLET_TRIGGERS, setter{MIN_FUNCTION {
            if (m_inlet_triggers.try_set_triggers_from_index_list(args, cerr)) {
                return args;
            }
            return triggers;
    }}};


    function handle_input = MIN_FUNCTION {
        if (inlet == OUTPUT_RANGE_INLET) {
            output.set(args);
            process({});
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
        if (!args.empty()) {
            if (auto v = AtomParser::atoms2voices<double>(args)) {
                m_scaler.value.set_values(*v);
            } else {
                cerr << v.err().message() << endl;
                return;
            }
        }

        // Note: triggers are already set by default
        m_scaler.scaler_node.update_time(TimePoint());
        auto output = m_scaler.scaler_node.process();
        outlet_main.send(AtomFormatter::voices2atoms<double>(output));
    }


    bool is_hot(std::size_t i) const { return m_inlet_triggers.is_hot(i); }

};


MIN_EXTERNAL(ser_scale);