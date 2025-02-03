#include <serialist_transport.h>

#include "c74_min.h"
#include "temporal/transport.h"

using namespace c74::min;


class transport : public object<transport> {
public:
    MIN_DESCRIPTION{""};
    MIN_TAGS{""};
    MIN_AUTHOR{""};
    MIN_RELATED{""};

    inlet<> inlet_main{this, "(bool/bang) non-zero to start, bang to output", ""};

    outlet<> outlet_bars{this, "bars", ""};
    outlet<> outlet_abs_beats{this, "absolute beats", ""};
    outlet<> outlet_rel_beats{this, "relative beats", ""};
    outlet<> outlet_ticks{this, "ticks", ""};
    outlet<> outlet_meter{this, "meter", ""};
    outlet<> outlet_tempo{this, "tempo", ""};
    outlet<> outlet_active{this, "active", ""};
    outlet<> dumpout{this, "(any) dumpout"};

    message<> number{this, "number", MIN_FUNCTION {
        if (static_cast<bool>(args[0])) {
            SerialistTransport::get_instance().start();
        } else {
            SerialistTransport::get_instance().pause();
        }
        return {};
    }};

    message<> start{this, "start", setter{MIN_FUNCTION {
        SerialistTransport::get_instance().start();
        return {};
    }}};

    message<> pause{this, "pause", setter{MIN_FUNCTION {
        SerialistTransport::get_instance().pause();
        return {};
    }}};

    message<> stop{this, "stop", setter{MIN_FUNCTION {
        SerialistTransport::get_instance().stop();
        return {};
    }}};

    message<> reset{this, "reset", setter{MIN_FUNCTION {
        SerialistTransport::get_instance().reset();
        return {};
    }}};

    message<> tempo{this, "tempo", setter{MIN_FUNCTION {
        if (inlet == 0 && !args.empty() && args[0].type() == message_type::float_argument) {
            if (auto v = static_cast<double>(args[0]); v > 0.0) {
                SerialistTransport::get_instance().set_tempo(v);
            } else {
                cerr << "tempo must be positive" << endl;
            }

        } else {
            cerr << "invalid type or number of arguments for message \"tempo\"" << inlet << endl;
        }
        return {};
    }}};


    message<> bang{this, "bang", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"bang\" for inlet " << inlet << endl;
            return {};
        }

        auto t = SerialistTransport::get_instance().get_time();
        outlet_active.send(t.get_transport_running());
        outlet_tempo.send(t.get_tempo());
        auto meter = t.get_meter();
        outlet_meter.send({meter.get_numerator(), meter.get_denominator()});
        outlet_ticks.send(t.get_tick());
        outlet_rel_beats.send(t.get_relative_beat());
        outlet_abs_beats.send(t.get_absolute_beat());
        outlet_bars.send(t.get_bar());

        return {};
    }}};
};


MIN_EXTERNAL(transport);