#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/operator.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "generatives/waveform.h"


using namespace c74::min;
using namespace serialist;

class ser_waveform : public object<ser_waveform> {
private:
    WaveformWrapper<> m_waveform;

public:
    MIN_DESCRIPTION{"Phase-based waveform generator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.oscillator, ser.random"};

    inlet<> inlet_main{this, "(float/list) phase", ""};
    inlet<> inlet_duty{this, "(float/list,  0-1) duty cycle", "", false};
    inlet<> inlet_curve{this, "(float/list) triangle curve", "", false};

    outlet<> outlet_main{this, "(float/list) waveform output"};
    outlet<> dumpout{this, "(any) dumpout"};

    attribute<bool> enabled{this, AttributeNames::ENABLED, true
                        , title{Titles::ENABLED}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value<bool>(args, m_waveform.enabled, cerr))
                return args;
            return enabled;
        }}
    };


    attribute<int> voices{this, AttributeNames::NUM_VOICES, 0
                          , title{Titles::NUM_VOICES}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value<std::size_t, int>(args, m_waveform.num_voices, cerr))
                return args;
            return voices;
        }}
    };


    attribute<std::vector<int>> mode{this, "mode", {static_cast<int>(Waveform::DEFAULT_MODE)}
                    , title{"Mode"}
        , description{""}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_vector(args, m_waveform.mode, cerr))
                return args;
            return mode;
        }}
    };


    attribute<std::vector<double>> duty{this, "duty", {Waveform::DEFAULT_DUTY}
        , title{"Duty"}
        , description{""}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_vector(args, m_waveform.duty, cerr))
                return args;
            return duty;
        }}
    };


    attribute<std::vector<double>> curve{this, "curve", {Waveform::DEFAULT_CURVE}
        , title{"Curve"}
        , description{""}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_vector(args, m_waveform.curve, cerr))
                return args;
            return curve;
        }}
    };


    function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            curve.set(args);
        } else if (inlet == 1) {
            duty.set(args);
        } else {
            this->process(args);
        }
        return {};
    };

    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void process(const atoms& args) {
        // Note: ser.waveform doesn't need a trigger, it can always trigger on receiving a phase

        if (!AttributeSetters::try_set_vector(args, m_waveform.phase, cerr)) {
            return;
        }

        auto time = SerialistTransport::get_instance().get_time();

        if (!time.get_transport_running()) {
            return;
        }

        auto& node = m_waveform.waveform;

        node.update_time(time);
        node.update_time(SerialistTransport::get_instance().get_time());
        auto output = node.process();

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }

};


MIN_EXTERNAL(ser_waveform);