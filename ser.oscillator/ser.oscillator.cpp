#include "c74_min.h"
#include "oscillator.h"
#include "unit_pulse.h"
#include "parsing.h"

using namespace c74::min;

class OscillatorWrapper {
public:
    ParameterHandler m_parameter_handler;

    // TODO: Proper, bang-based strategy for trigger
    UnitPulse m_trigger{"", m_parameter_handler};
    Variable<Facet, Oscillator::Type> m_type{"", m_parameter_handler, Oscillator::Type::phasor};
    Variable<Facet, float> m_freq{"", m_parameter_handler, 0.25f};
    Variable<Facet, float> m_mul{"", m_parameter_handler, 1.0f};
    Variable<Facet, float> m_add{"", m_parameter_handler, 0.0f};
    Variable<Facet, float> m_duty{"", m_parameter_handler, 0.5f};
    Variable<Facet, float> m_curve{"", m_parameter_handler, 1.0f};
    Variable<Facet, bool> m_enabled{"", m_parameter_handler, true};
    Variable<Facet, int> m_num_voices{"", m_parameter_handler, 1};

    Oscillator m_oscillator{"", m_parameter_handler, &m_trigger, &m_type, &m_freq, &m_add, &m_mul
                            , &m_duty, &m_curve, &m_enabled, &m_num_voices};
};

class oscillator : public object<oscillator> {
public:
    MIN_DESCRIPTION{"Multi-channel oscillator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Joakim Borg"};
    MIN_RELATED{"ser.generator, ser.pulsator"};

    inlet<> trigger_inlet{this, "(bang) trigger oscillator output"};
    inlet<> enabled_inlet{this, "(bool/list) enabled"};
    inlet<> freq_inlet{this, "(float/list) freq"};
    inlet<> type_inlet{this, "(int/list) type"};
    inlet<> mul_inlet{this, "(float/list) mul"};
    inlet<> add_inlet{this, "(float/list) add"};
    inlet<> duty_inlet{this, "(float/list) duty"};
    inlet<> curve_inlet{this, "(float/list) curve"};
    inlet<> num_voices_inlet{this, "(int/list) num voices"};

    outlet<> outlet{this, "(float/list) oscillator output"};

    attribute<symbol> clock{this, "clock", "", setter{MIN_FUNCTION {
        cout << "clock not implemented yet" << endl;
        return args;
    }}};

    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 0) {
            process(args);
        }
        return {};
    };

    message<> list{this, "list", "my docstring for list arg", handle_input};
    message<> anything{this, "anything", "my docstring for anything arg", handle_input};
    message<> number{this, "number", "my docstring for number arg", handle_input};
    message<> bang{this, "bang", "my docstring for bang arg", handle_input};


private:
    void process(const atoms& args) {
        (void) args;
        // TODO: use `args` to set pulsator values
        auto voices = m_oscillator_wrapper.m_oscillator.process();
        auto formatted_atoms = parsing::voices2atoms<float>(voices);
        if (formatted_atoms.is_ok()) {
            outlet.send(formatted_atoms.ok());
        }
    }


private:
    OscillatorWrapper m_oscillator_wrapper;


};


MIN_EXTERNAL(oscillator);