
#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/operator.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "generatives/waveform.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"


using namespace c74::min;
using namespace serialist;

class ser_waveform : public object<ser_waveform> {
private:
    WaveformWrapper<> m_waveform;

    static const inline auto MODE_DESCR = Inlets::value(Types::number, "phase (0), sin (1), square (2) or tri (3)");

public:
    MIN_DESCRIPTION{"Multi-channel Phase-based waveform function"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phase, ser.random, ser.lowpass"};

    inlet<> inlet_main{this, Inlets::voice(Types::phase, "position in waveform")};
    inlet<> inlet_duty{this, Inlets::voice(Types::phase, "duty cycle")};
    inlet<> inlet_curve{this, Inlets::voice(Types::number, "triangle curve")};

    outlet<> outlet_main{this, Inlets::voice(Types::phase, "waveform output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    SER_ENABLED_ATTRIBUTE(m_waveform.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_waveform.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();
    SER_DETACH_ATTRIBUTE_STATELESS();

    value_attribute<Waveform::Mode> mode{this, "mode", m_waveform.mode, Waveform::DEFAULT_MODE, cerr};

    vector_attribute<double> duty{this, "duty", m_waveform.duty, Waveform::DEFAULT_DUTY, cerr};

    vector_attribute<double> curve{this, "curve", m_waveform.curve, Waveform::DEFAULT_CURVE, cerr};

    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> duty >> curve >> detach;
    });

    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << duty << curve << detach;
    });


    function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            curve.set(args);
        } else if (inlet == 1) {
            duty.set(args);
        } else {
            process(args);
        }
        return {};
    };

    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void process(const atoms& args) {
        // Note: ser.waveform doesn't need a trigger, it should always trigger on receiving a phase

        if (!AttributeSetters::try_set_vector(args, m_waveform.phase, cerr)) {
            return;
        }

        auto time = SerialistTransport::get_instance().get_time();
        SerialistTransport::apply_detach(time, detach.get());

        if (!time.get_transport_running()) {
            return;
        }


        auto& node = m_waveform.waveform;

        node.update_time(time);
        auto output = node.process();

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }

};


MIN_EXTERNAL(ser_waveform);