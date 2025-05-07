#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/phase_map.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"


using namespace c74::min;
using namespace serialist;


class ser_phasemap : public object<ser_phasemap> {
private:
    PhaseMapWrapper<> m_phasemap;

public:
    MIN_DESCRIPTION{"Map a single long phase to several shorter phases"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phase, ser.phasepulse"};

    inlet<> inlet_main{this, Inlets::voice(Types::phase, "Input phase to map")};
    inlet<> inlet_durations{this, Inlets::voice(Types::phase, "Durations as fractions of incoming phase"), "", false};

    outlet<> outlet_main{this, Inlets::voice(Types::phase, "Mapped phase")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    SER_ENABLED_ATTRIBUTE(m_phasemap.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_phasemap.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();

    pseudo_attribute<double> durations{this, "durations", m_phasemap.durations, cerr};


    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> durations;
    });


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << durations;
    });


    function handle_input = MIN_FUNCTION {
        if (inlet == 1) {
            durations.set(args);
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
        if (auto cursor = AtomParser::atoms2vec<double>(args)) {
            m_phasemap.cursor.set_values(Voices<double>::transposed(*cursor));

            auto time = SerialistTransport::get_instance().get_time();
            if (!time.get_transport_running()) {
                return;
            }

            auto& node = m_phasemap.phase_map_node;
            node.update_time(time);

            auto output = node.process();

            auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
            outlet_main.send(formatted_atoms);

        } else {
            cerr << cursor.err().message() << endl;
        }
    }

};


MIN_EXTERNAL(ser_phasemap);