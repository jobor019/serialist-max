#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/lowpass.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"


using namespace c74::min;
using namespace serialist;


class ser_lowpass : public object<ser_lowpass> {
private:
    LowPassWrapper<> m_lowpass;

    static const inline auto TAU_DESCRIPTION = Inlets::voices(Types::number, "Set time constant");

public:
    MIN_DESCRIPTION{"One-pole filter for temporally unevenly sampled signals"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phase"};

    inlet<> inlet_main{this, Inlets::voice(Types::number, "Input to filter")};
    inlet<> inlet_tau{this, TAU_DESCRIPTION, "", false};

    outlet<> outlet_main{this, Inlets::voice(Types::phase, "Filtered signal")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    SER_ENABLED_ATTRIBUTE(m_lowpass.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_lowpass.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();
    SER_DETACH_ATTRIBUTE_STATELESS();

    vector_attribute<double> tau{this, "tau", m_lowpass.tau, LowPass::DEFAULT_TAU, cerr};

    value_attribute<DomainType> tau_type{this, "tautype", m_lowpass.tau_type, LowPass::DEFAULT_TAU_TYPE, cerr};

    value_attribute<bool> stepped{this, "stepped", m_lowpass.is_stepped, LowPass::DEFAULT_UNIT_STEP, cerr};

    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> tau >> tau_type >> stepped >> detach;
    });

    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << tau << tau_type << stepped << detach;
    });

    function handle_input = MIN_FUNCTION {
        if (inlet == 1) {
            tau.set(args);
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
        auto time = SerialistTransport::get_instance().get_time();
        SerialistTransport::apply_detach(time, detach.get());

        if (!time.get_transport_running()) {
            return;
        }

        if (auto input = AtomParser::atoms2vec<double>(args)) {
            m_lowpass.input.set_values(Voices<double>::transposed(*input));

            auto& node = m_lowpass.lowpass;
            node.update_time(time);

            auto output = node.process();

            auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
            outlet_main.send(formatted_atoms);

        } else {
            cerr << input.err().message() << endl;
        }
    }
};


MIN_EXTERNAL(ser_lowpass);