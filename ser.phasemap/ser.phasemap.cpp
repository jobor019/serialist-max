#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/phase_map.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"


using namespace c74::min;
using namespace serialist;

using namespace c74::min;


class ser_phasemap : public c74::min::object<ser_phasemap> {
private:
    PhaseMapWrapper<> m_phasemap;

public:
    MIN_DESCRIPTION{"Map a single long phase to several shorter phases"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.oscillator, ser.phasepulse"};

    inlet<> inlet_main{this, "(float/list) cursor position / control messages", "", true};
    inlet<> inlet_durations{this, "(float/list) durations", "", false};

    outlet<> outlet_main{this, "output", ""}; // TODO
    outlet<> dumpout{this, "(any) dumpout"};


    attribute<bool> enabled{this, AttributeNames::ENABLED
                        , true
                        , title{Titles::ENABLED}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_phasemap.enabled, cerr))
                return args;
            return enabled;
        }}
    };

    attribute<int> voices{this, AttributeNames::NUM_VOICES
                          , 0
                          , title{Titles::NUM_VOICES}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_phasemap.num_voices, cerr))
                return args;
            return voices;
        }}
    };


    attribute<std::vector<double>> durations{this, "durations"
                                          , Vec<double>::singular(PhaseMap::DEFAULT_DURATION).vector()
                                          , title{"durations"}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_vector_singular(args, m_phasemap.durations, cerr))
                return args;
            return durations;
        }}
    };

    function handle_input = MIN_FUNCTION {
        if (inlet == 1) {
            durations.set(args);
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
            return;
        }
    }

};


MIN_EXTERNAL(ser_phasemap);