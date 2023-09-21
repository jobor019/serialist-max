#include "c74_min.h"
#include "oscillator.h"
#include "unit_pulse.h"
#include "parsing.h"
#include "max_timepoint.h"

using namespace c74::min;

class OscillatorWrapper {
public:
    ParameterHandler m_parameter_handler;

    // TODO: Proper, bang-based strategy for trigger
    UnitPulse m_trigger{"", m_parameter_handler};
    Variable<Facet, Oscillator::Type> m_type{"", m_parameter_handler, Oscillator::Type::phasor};
    Variable<Facet, float> m_freq{"", m_parameter_handler, 0.25f};
    Variable<Facet, float> m_mul{"", m_parameter_handler, 2.0f};
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
    inlet<> type_inlet{this, "(int/list) type"};
    inlet<> freq_inlet{this, "(float/list) freq"};
    inlet<> mul_inlet{this, "(float/list) mul"};
    inlet<> add_inlet{this, "(float/list) add"};
    inlet<> duty_inlet{this, "(float/list) duty"};
    inlet<> curve_inlet{this, "(float/list) curve"};
    inlet<> num_voices_inlet{this, "(int) num voices"};

    outlet<> outlet{this, "(float/list) oscillator output"};

    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}};

    c74::min::function handle_input = MIN_FUNCTION {
        switch (inlet) {
            case 0: process(args); break;
            case 1: set_enabled(args); break;
            case 2: set_type(args); break;
            case 3: set_freq(args); break;
            case 4: set_mul(args); break;
            case 5: set_add(args); break;
            case 6: set_duty(args); break;
            case 7: set_curve(args); break;
            case 8: set_num_voices(args); break;
            default: cerr << "invalid inlet" << endl;
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
        auto time = MaxTimePoint::get_time_of(clock.get());
        if (!time) {
            cerr << "unknown clock source" << endl;
            return;
        }
        auto time_point = static_cast<TimePoint>(*time);

        m_oscillator_wrapper.m_trigger.update_time(time_point);
        m_oscillator_wrapper.m_oscillator.update_time(time_point);


        auto voices = m_oscillator_wrapper.m_oscillator.process();
        cout << voices.size() << endl;

        auto front = voices.front();
        if (front) {
            cout << static_cast<double>(*front) << endl;
        } else {
            cout << "NO ITEM IN VOICE" << endl;
        }


        auto formatted_atoms = parsing::voices2atoms<float>(voices);
        if (formatted_atoms.is_ok()) {
            outlet.send(formatted_atoms.ok());
        }
    }

    void set_enabled(const atoms& args) {
        cerr << "set_enabled is not implemented" << endl;
    }

    void set_freq(const atoms& args) {
        cerr << "set_freq is not implemented" << endl;
    }


    void set_type(const atoms& args) {
        cerr << "set_type is not implemented" << endl;
    }



    void set_mul(const atoms& args) {
        cerr << "set_mul is not implemented" << endl;
    }



    void set_add(const atoms& args) {
        cerr << "set_add is not implemented" << endl;
    }


    void set_duty(const atoms& args) {
        cerr << "set_duty is not implemented" << endl;
    }


    void set_curve(const atoms& args) {
        cerr << "set_curve is not implemented" << endl;
    }


    void set_num_voices(const atoms& args) {
        if (args.size() != 1) {
            cerr << "wrong number of arguments for \"num voices\"" << endl;
            return;
        }

        auto atm = args.at(0);
        if (atm.type() == message_type::float_argument || atm.type() == message_type::int_argument) {
            auto v = static_cast<int>(atm);
            if (v < 0) {
                cerr << "num voices must be a non-negative value" << endl;
                return;
            }
            m_oscillator_wrapper.m_num_voices.set_value(v);

        } else {
            cerr << "wrong argument type for \"num voices\"" << endl;
            return;
        }
    }










private:
    OscillatorWrapper m_oscillator_wrapper;


};


MIN_EXTERNAL(oscillator);