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

    static const inline auto PERIOD_DESCRIPTION = Inlets::voices(Types::number, "Set period");
    static const inline auto OFFSET_DESCRIPTION = Inlets::voices(Types::number, "Set offset");

public:
    MIN_DESCRIPTION{"Multi-channel phase accumulator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.waveform, ser.phasemap, ser.random"};

    inlet<> inlet_main{this , Inlets::trigger_info("When mode is set to \"triggered\", trigger output")
                       , "" , [this] { return inlet_is_hot(); }};

    inlet<> inlet_period{this, PERIOD_DESCRIPTION};
    inlet<> inlet_offset{this, OFFSET_DESCRIPTION};

    outlet<> outlet_main{this, Inlets::voices(Types::phase, "Phase output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};


    SER_ENABLED_ATTRIBUTE(m_phase.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_phase.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();

    timer<> metro { this, MIN_FUNCTION {
        // In terms of thread safety, it's probably better to continuously poll the timer and perform this check
        // rather than starting and stopping the timer from different threads
        if (mode.get() != PaMode::triggered) {
            process({});
        }

        metro.delay(poll_interval.get());
        return {};
    }
    };

    value_attribute<PaMode> mode{this, "mode", m_phase.mode, PhaseAccumulator::DEFAULT_MODE, cerr, "", &m_mutex};

    vector_attribute<double> period{this, "period", m_phase.period, PaParameters::DEFAULT_PERIOD, cerr, "", &m_mutex};

    value_attribute<DomainType> period_type{this, "periodtype", m_phase.period_type, PaParameters::DEFAULT_PERIOD_TYPE, cerr, "", &m_mutex};

    vector_attribute<double> offset{this, "offset", m_phase.offset, PaParameters::DEFAULT_OFFSET, cerr, "", &m_mutex};

    value_attribute<DomainType> offset_type{this, "offsettype", m_phase.offset_type, PaParameters::DEFAULT_OFFSET_TYPE, cerr, "", &m_mutex};

    vector_attribute<double> step_size{this, "stepsize", m_phase.step_size, PaParameters::DEFAULT_STEP_SIZE, cerr, "", &m_mutex};

    attribute<int> poll_interval{ this, "pollinterval", 1, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<int>(args)) {
					return {std::max(0, *v)};
				} else {
				    cerr << v.err().message() << endl;
				}
                return poll_interval;
            }
        }
    };


    message<> setup{this, "setup", "", setter{ MIN_FUNCTION {
            LoadState s{state()};
            s >> enabled >> mode >> period >> period_type >> offset >> offset_type >> step_size >> poll_interval;

            metro.delay(0);
            return {};
        }}
    };


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << mode << period << period_type << offset << offset_type << step_size << poll_interval;
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