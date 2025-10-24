#include <serialist_transport.h>

#include "c74_min.h"
#include "max_stereotypes.h"
#include "temporal/transport.h"

using namespace c74::min;


class ser_transport : public object<ser_transport>
                      , public SerialistTransport::Listener {
private:
    std::atomic<int> m_poll_interval{1}; // accessing poll_interval.get() directly on timer thread is probably UB?

    static constexpr std::size_t TEMPO_INLET = 1;
    static constexpr std::size_t METER_INLET = 2;

public:
    MIN_DESCRIPTION{"Control the global Serialist transport"};
    MIN_TAGS{""};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phase, ser.lowpass"};

    inlet<> inlet_main{this, "(bool/bang) non-zero to start, bang to poll", ""};
    inlet<> inlet_tempo{this, "(float) tempo", "", false};
    inlet<> inlet_meter{this, "(int, int) meter", "", false};

    outlet<> outlet_bars{this, "bars", ""};
    outlet<> outlet_abs_beats{this, "absolute beats", ""};
    outlet<> outlet_rel_beats{this, "relative beats", ""};
    outlet<> outlet_ticks{this, "ticks", ""};
    outlet<> outlet_tempo{this, "tempo", ""};
    outlet<> outlet_meter{this, "meter", ""};
    outlet<> outlet_active{this, "active", ""};
    outlet<> dumpout{this, "(any) dumpout"};

    explicit ser_transport(const atoms& args = {}) {
        SerialistTransport::get_instance().add_listener(*this);
        // metro.delay(0.0);
    }


    ~ser_transport() override {
        SerialistTransport::get_instance().remove_listener(*this);
    }


    void on_transport_state_change(bool active) override {
        assert(c74::max::systhread_ismainthread());
        outlet_active.send(active);
    }


    // TODO: This seems to clog the scheduler thread completely
    // timer<> metro { this, MIN_FUNCTION {
    //     if (m_poll_interval > 0) {
    //         output_state();
    //         metro.delay(m_poll_interval);
    //         return {};
    //     }
    //
    //     metro.delay(1.0);
    //     return {};
    // }
    // };


    attribute<int> poll_interval{ this, "pollinterval", 0, Descriptions::POLL_INTERVAL, setter{
        MIN_FUNCTION {
            if (auto v = AtomParser::atoms2value<int>(args)) {
                auto clipped_value = std::max(0, *v);
                m_poll_interval = clipped_value;
                return {clipped_value};

            } else {
                cerr << v.err().message() << endl;
            }
            return poll_interval;
        }
    }
    };


    message<> number{this, "number", MIN_FUNCTION {
        if (inlet == METER_INLET) {
            cerr << "wrong number of args to set meter" << inlet << endl;
            return {};
        }

        if (inlet == TEMPO_INLET) {
            set_tempo(args);
            return {};
        }

        // inlet == 0: set state
        if (static_cast<bool>(args[0])) {
            start();
        } else {
            pause();
        }
        return {};
    }};


    message<threadsafe::no> start{this, "start", setter{MIN_FUNCTION {
        // Note: this will output current state through listener callback.
        //       Due to callback, **must** be called from main thread (threadsafe::no)
        SerialistTransport::get_instance().start();
        return {};
    }}};


    message<threadsafe::no> pause{this, "pause", setter{MIN_FUNCTION {
        // Note: this will output current state through listener callback.
        //       Due to callback, **must** be called from main thread (threadsafe::no)
        SerialistTransport::get_instance().pause();
        return {};
    }}};


    message<threadsafe::no> stop{this, "stop", setter{MIN_FUNCTION {
        // Note: this will output current state through listener callback.
        //       Due to callback, **must** be called from main thread (threadsafe::no)
        SerialistTransport::get_instance().stop();
        return {};
    }}};


    message<> reset{this, "reset", setter{MIN_FUNCTION {
        SerialistTransport::get_instance().reset();
        return {};
    }}};


    message<> tempo{this, "tempo", setter{MIN_FUNCTION {
        if (inlet == 0) {
            set_tempo(args);
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

        set_meter(args);

        return {};
    }}};


    message<> bang{this, "bang", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"bang\" for inlet " << inlet << endl;
            return {};
        }

        output_state();

        return {};
    }}};


    message<> list{this, "list", setter{MIN_FUNCTION {
        if (inlet != METER_INLET) {
            cerr << "invalid message \"list\" for inlet " << inlet << endl;
            return {};
        }

        set_meter(args);
        return {};
    }}};




private:
    void set_tempo(const atoms& args) {
        if (auto tempo = AtomParser::atoms2value<double>(args)) {
            if (*tempo > 0.0) {
                SerialistTransport::get_instance().set_tempo(*tempo);
            } else {
                cerr << "tempo must be positive" << endl;
            }
        } else {
            cerr << tempo.err().message() << endl;
        }
    }


    void set_meter(const atoms& args) {
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
    }


    void output_state() {
        // Note: the min-api threading guide (https://cycling74.github.io/min-devkit/guide/threading) specifies two things:
        //       - calling an outlet from either the main thread or the timer thread is safe
        //       - never call an outlet while holding a lock
        //
        // For this reason, even though this function may be called from either the timer thread (through its internal
        // metro) or from the main thread (through an explicit bang), we should be able to assume that this is safe, as
        // the only alternative would be to lock a mutex here, which the guide strictly prohibits.
        auto t = SerialistTransport::get_instance().get_time();
        outlet_active.send(t.get_transport_running());
        outlet_tempo.send(t.get_tempo());
        auto meter = t.get_meter();
        outlet_meter.send({meter.get_numerator(), meter.get_denominator()});
        outlet_ticks.send(t.get_tick());
        outlet_rel_beats.send(t.get_relative_beat());
        outlet_abs_beats.send(t.get_absolute_beat());
        outlet_bars.send(t.get_bar());
    }

};


MIN_EXTERNAL(ser_transport);