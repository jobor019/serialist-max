#include <serialist_transport.h>
#include <core/policies/policies.h>
#include "generatives/sample_and_hold.h"

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"


using namespace c74::min;


class ser_snh : public object<ser_snh> {
private:
    SampleAndHoldWrapper<> m_snh;

    static const inline auto HOLD_DESCRIPTION = Inlets::voice(Types::number, "Set hold state (non-zero = open)");

public:
    MIN_DESCRIPTION{"Multi-channel Sample & hold"};
    MIN_TAGS{""};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phasepulse, ser.oscillator"};

    inlet<> inlet_main{this, Inlets::voices(Types::number, "values to sample and hold")};
    inlet<> inlet_hold{this, HOLD_DESCRIPTION, "", true};

    outlet<> outlet_main{this, Inlets::voices(Types::number, "sampled and held output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    SER_ENABLED_ATTRIBUTE(m_snh.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_snh.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();

    pseudo_attribute<double> hold{this, "hold", m_snh.hold_state, cerr
        , HOLD_DESCRIPTION
        , input_format::vector , nullptr , [this] { this->process(); } };

    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> hold;
    });

    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << hold;
    });


    function handle_input = MIN_FUNCTION {
        if (inlet == 1) {
            hold.set(args);
        } else {
            this->process_input(args);
        }
        return {};
    };


    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void process_input(const atoms& args) {
        if (AttributeSetters::try_set_voices(args, m_snh.input_value, cerr)) {
            process();
        }
    }

    void process() {
        auto time = SerialistTransport::get_instance().get_time();
        if (!time.get_transport_running()) {
            return;
        }

        auto& node = m_snh.sample_and_hold;

        node.update_time(time);
        auto output = node.process();

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }


};


MIN_EXTERNAL(ser_snh);