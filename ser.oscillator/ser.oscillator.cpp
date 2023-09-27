#include "c74_min.h"
#include "oscillator.h"
#include "unit_pulse.h"
#include "parsing.h"
#include "max_timepoint.h"
#include "sequence.h"

using namespace c74::min;

class OscillatorWrapper {
public:
    ParameterHandler m_parameter_handler;

    // TODO: Proper, bang-based strategy for trigger
    UnitPulse m_trigger{"", m_parameter_handler};
    Sequence<Facet, Oscillator::Type> m_type{"", m_parameter_handler, Oscillator::Type::phasor};
    Sequence<Facet, float> m_freq{"", m_parameter_handler, 0.25f};
    Sequence<Facet, float> m_mul{"", m_parameter_handler, 1.0f};
    Sequence<Facet, float> m_add{"", m_parameter_handler, 0.0f};
    Sequence<Facet, float> m_duty{"", m_parameter_handler, 0.5f};
    Sequence<Facet, float> m_curve{"", m_parameter_handler, 1.0f};
    Sequence<Facet, bool> m_stepped{"", m_parameter_handler, false};
    Sequence<Facet, bool> m_enabled{"", m_parameter_handler, true};
    Variable<Facet, int> m_num_voices{"", m_parameter_handler, 1};

    Oscillator m_oscillator{"", m_parameter_handler, &m_trigger, &m_type, &m_freq, &m_add, &m_mul
                            , &m_duty, &m_curve, &m_enabled, &m_stepped, &m_num_voices};
};

class oscillator : public object<oscillator> {
public:
    MIN_DESCRIPTION{"Multi-channel oscillator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.generator, ser.pulsator"};

    inlet<> trigger_inlet{this, "(any) control messages"};
    inlet<> freq_inlet{this, "(float/list) freq"};
    inlet<> mul_inlet{this, "(float/list) mul"};
    inlet<> add_inlet{this, "(float/list) add"};

    outlet<> outlet{this, "(float/list) oscillator output"};

    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}};

    c74::min::function handle_input = MIN_FUNCTION {
        switch (inlet) {
            case 0:
                process(args);
                break;
            case 1:
                set_freq(args);
                break;
            case 2:
                set_mul(args);
                break;
            case 3:
                set_add(args);
                break;
            default:
                cerr << "invalid inlet" << endl;
        }
        return {};
    };


    message<> type{this, "type", "(int/list) my docstring for type arg", MIN_FUNCTION {
        set_type(args);
        return {};
    }};
    message<> freq{this, "freq", "(float/list) my docstring for freq arg", MIN_FUNCTION {
        set_freq(args);
        return {};
    }};
    message<> mul{this, "mul", "(float/list) my docstring for mul arg", MIN_FUNCTION {
        set_mul(args);
        return {};
    }};
    message<> add{this, "add", "(float/list) my docstring for add arg", MIN_FUNCTION {
        set_add(args);
        return {};
    }};
    message<> duty{this, "duty", "(float/list) my docstring for duty arg", MIN_FUNCTION {
        set_duty(args);
        return {};
    }};
    message<> curve{this, "curve", "(float/list) my docstring for curve arg", MIN_FUNCTION {
        set_curve(args);
        return {};
    }};
    message<> stepped{this, "stepped", "(bool/list) my docstring for stepped arg", MIN_FUNCTION {
        set_stepped(args);
        return {};
    }};
    message<> enabled{this, "enabled", "(bool/list) my docstring for enabled arg", MIN_FUNCTION {
        set_enabled(args);
        return {};
    }};
    message<> voices{this, "voices", "(int) my docstring for num_voices arg", MIN_FUNCTION {
        set_num_voices(args);
        return {};
    }};

    message<> bang{this, "bang", "my docstring for bang arg", handle_input};
    message<> list{this, "list", "my docstring for list arg", handle_input};


private:
    void process(const atoms& args) {
        (void) args;
        // TODO: use `args` to set pulsator values
        auto time = MaxTimePoint::get_time_of(clock.get());
        if (!time) {
            cerr << "unknown clock source" << endl;
            return;
        }
        auto time_point = time->as_time_point();

        cout << time_point.get_tick() << endl;

        m_oscillator_wrapper.m_trigger.update_time(time_point);
        m_oscillator_wrapper.m_oscillator.update_time(time_point);


        auto voices = m_oscillator_wrapper.m_oscillator.process();
//        cout << voices.size() << endl;


//        if (auto front = voices.front()) {
//            cout << static_cast<double>(*front) << endl;
//        } else {
//            cout << "NO ITEM IN VOICE" << endl;
//        }


        auto formatted_atoms = parsing::voices2atoms<float>(voices);
        if (formatted_atoms.is_ok()) {
            outlet.send(formatted_atoms.ok());
        }
    }


    void set_freq(const atoms& args) {
        cout << "setting freq" << endl;
        if (auto v = parsing::from_atoms<float>(args)) {
            m_oscillator_wrapper.m_freq.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_type(const atoms& args) {
        cout << "setting type" << endl;
        if (auto v = parsing::from_atoms<Oscillator::Type>(args)) {
            m_oscillator_wrapper.m_type.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_mul(const atoms& args) {
        cout << "setting mul" << endl;
        if (auto v = parsing::from_atoms<float>(args)) {
            m_oscillator_wrapper.m_mul.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_add(const atoms& args) {
        cout << "setting add" << endl;
        if (auto v = parsing::from_atoms<float>(args)) {
            m_oscillator_wrapper.m_add.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_duty(const atoms& args) {
        cout << "setting duty" << endl;
        if (auto v = parsing::from_atoms<float>(args)) {
            m_oscillator_wrapper.m_duty.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_curve(const atoms& args) {
        cout << "setting curve" << endl;
        if (auto v = parsing::from_atoms<float>(args)) {
            m_oscillator_wrapper.m_curve.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_enabled(const atoms& args) {
        cout << "setting enabled" << endl;
        if (auto v = parsing::from_atoms<bool>(args)) {
            m_oscillator_wrapper.m_enabled.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_stepped(const atoms& args) {
        cout << "setting stepped" << endl;
        if (auto v = parsing::from_atoms<bool>(args)) {
            m_oscillator_wrapper.m_stepped.set_transposed(v.ok());
        } else {
            cerr << v.err() << endl;
        }
    }


    void set_num_voices(const atoms& args) {
        if (auto v = parsing::parse_single<int>(args)) {
            m_oscillator_wrapper.m_num_voices.set_value(v.ok());
        } else {
            cerr << v.err() << endl;
            return;
        }
    }


    OscillatorWrapper m_oscillator_wrapper;


};


MIN_EXTERNAL(oscillator);