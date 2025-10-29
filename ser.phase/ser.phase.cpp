#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <generatives/phase_node.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_timepoint.h"
#include "max_stereotypes.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"


using namespace c74::min;
using namespace serialist;

class ser_phase : public object<ser_phase> {
private:
    PhaseWrapper<> m_phase;
    std::mutex m_mutex;
    std::atomic<int> m_poll_interval{1}; // accessing poll_interval.get() directly on timer thread is probably UB?

    static const inline auto PERIOD_DESCRIPTION = Inlets::voice(Types::number, "Set period");
    static const inline auto OFFSET_DESCRIPTION = Inlets::voice(Types::number, "Set offset");

    static const inline auto POLL_INTERVAL_DESCR = Descriptions::append(
        Descriptions::POLL_INTERVAL,
        " \nNote that when the mode is set to \"triggered\", polling is always disabled."
    );


public:
    MIN_DESCRIPTION{"Multi-channel phase accumulator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.index, ser.phasemap, ser.random, ser.waveform, ser.pulse, ser.interpolate, ser.transport"};

    inlet<> inlet_main{this , Inlets::trigger_info("When mode is set to \"triggered\", trigger output")
                       , "" , [this] { return inlet_is_hot(); }};

    inlet<> inlet_period{this, PERIOD_DESCRIPTION, "", false};
    inlet<> inlet_offset{this, OFFSET_DESCRIPTION, "", false};

    outlet<> outlet_main{this, Inlets::voice(Types::phase, "Phase output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};


    SER_ENABLED_ATTRIBUTE(m_phase.enabled, &m_mutex);
    SER_NUM_VOICES_ATTRIBUTE(m_phase.num_voices, &m_mutex);
    SER_AUTO_RESTORE_ATTRIBUTE();
    SER_DETACH_ATTRIBUTE_STATELESS();

    timer<> metro { this, MIN_FUNCTION {
        // In terms of thread safety, it's probably better to continuously poll the timer and perform this check
        // rather than attempting to start and stop the timer from different threads
        if (m_poll_interval > 0 && mode.get() != PaMode::triggered) {
            process({});

            metro.delay(m_poll_interval);
            return {};
        }

        metro.delay(1.0);
        return {};
    }
    };

    value_attribute<PaMode> mode{this, "mode", m_phase.mode, PhaseAccumulator::DEFAULT_MODE, cerr, "", &m_mutex};

    vector_attribute<double> period{this, "period", m_phase.period, PaParameters::DEFAULT_PERIOD, cerr, "", &m_mutex};

    value_attribute<DomainType> period_type{this, "periodtype", m_phase.period_type, PaParameters::DEFAULT_PERIOD_TYPE, cerr, "", &m_mutex};

    vector_attribute<double> offset{this, "offset", m_phase.offset, PaParameters::DEFAULT_OFFSET, cerr, "", &m_mutex};

    value_attribute<DomainType> offset_type{this, "offsettype", m_phase.offset_type, PaParameters::DEFAULT_OFFSET_TYPE, cerr, "", &m_mutex};

    vector_attribute<double> step_size{this, "stepsize", m_phase.step_size, PaParameters::DEFAULT_STEP_SIZE, cerr, "", &m_mutex};

    attribute<int> poll_interval{ this, "pollinterval", 1, POLL_INTERVAL_DESCR, setter{
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

    message<> setup{this, "setup", "", setter{ MIN_FUNCTION {
            LoadState s{state()};
            s >> enabled >> mode >> period >> period_type >> offset >> offset_type >> step_size >> poll_interval >> detach;

            metro.delay(0);
            return {};
        }}
    };


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << mode << period << period_type << offset << offset_type << step_size << poll_interval << detach;
    });


    message<> reset{this, "reset", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"reset\" for inlet " << inlet << endl;
            return {};
        }

        std::lock_guard lock(m_mutex);
        m_phase.reset_trigger.set_values(Trigger::pulse_on());
        return {};
    }}};


    function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            offset.set(args);
        } else if (inlet == 1) {
            period.set(args);
        } else {
            this->process(args);
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
        auto time = SerialistTransport::get_instance().get_time();
        SerialistTransport::apply_detach(time, detach.get());

        if (!time.get_transport_running()) {
            return;
        }

        // CRITICAL SECTION

        std::unique_lock lock(m_mutex);

        if (args.empty()) {
            // bang received: trigger all voices
            m_phase.trigger.set_values(Voices<Trigger>::singular(Trigger::pulse_on()));

        } else if (auto triggers = AtomParser::atoms2triggers(args)) {
            // trigger message received, trigger specific voices
            m_phase.trigger.set_values(*triggers);

        } else {
            cerr << "doesn't understand " << args[0] << endl;
            return;
        }

        auto& node = m_phase.phase_node;

        node.update_time(time);
        auto output = node.process();

        if (!m_phase.reset_trigger.get_values().is_empty_like()) {
            m_phase.reset_trigger.set_values(Voices<Trigger>::empty_like());
        }

        lock.unlock();

        // CRITICAL SECTION END

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }


    bool inlet_is_hot() {
        return mode.get() == PaMode::triggered;
    }
};


MIN_EXTERNAL(ser_phase)