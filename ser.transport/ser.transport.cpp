#include <serialist_transport.h>

#include "c74_min.h"
#include "temporal/transport.h"

using namespace c74::min;


class ser_transport : public object<ser_transport>
                      , public SerialistTransport::Listener {
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

    explicit ser_transport(const atoms& args = {}) {
        SerialistTransport::get_instance().add_listener(*this);
    }


    ~ser_transport() override {
        SerialistTransport::get_instance().remove_listener(*this);
    }


    void on_transport_state_update(const TimePoint& t) override {
        assert(c74::max::systhread_ismainthread());
        outlet_active.send(t.get_transport_running());
    }


    message<> number{this, "number", MIN_FUNCTION {
        if (static_cast<bool>(args[0])) {
            start();
        } else {
            pause();
        }
        return {};
    }};


    message<threadsafe::no> start{this, "start", setter{MIN_FUNCTION {
        // Note: this will output current state through listener callback.
        //       Due to callback, **must** be called from main thread
        SerialistTransport::get_instance().start();
        return {};
    }}};


    message<threadsafe::no> pause{this, "pause", setter{MIN_FUNCTION {
        // Note: this will output current state through listener callback.
        //       Due to callback, **must** be called from main thread
        SerialistTransport::get_instance().pause();
        return {};
    }}};


    message<threadsafe::no> stop{this, "stop", setter{MIN_FUNCTION {
        // Note: this will output current state through listener callback.
        //       Due to callback, **must** be called from main thread
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


    message<> meter{this, "meter", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"meter\" for inlet " << inlet << endl;
            return {};
        }

        // Input: "null"
        if (args.size() == 1 && args[0].type() == message_type::symbol_argument && args[0] == "null") {
            SerialistTransport::get_instance().set_meter(std::nullopt);
        }

        // input: [numerator, denominator]
        else if (args.size() == 2
            && args[0].type() == message_type::int_argument
            && args[1].type() == message_type::int_argument) {
            auto num = static_cast<int>(args[0]);
            auto denom = static_cast<int>(args[1]);
            if (num > 0 && denom > 0) {
                SerialistTransport::get_instance().set_meter(Meter(num, denom));
            } else {
                cerr << "numerator and denominator must be positive" << endl;
            }

        } else {
            cerr << R"(bad argument for message "meter". Expected "null" or [numerator, denominator])" << endl;
        }

        return {};
    }}};


    message<> bang{this, "bang", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"bang\" for inlet " << inlet << endl;
            return {};
        }

        auto t = SerialistTransport::get_instance().update_time();
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


MIN_EXTERNAL(ser_transport);