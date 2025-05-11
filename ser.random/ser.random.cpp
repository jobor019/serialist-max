#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/random_node.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"
#include "attribute_setters.h"
#include "message_stereotypes.h"


using namespace c74::min;
using namespace serialist;


class ser_random : public object<ser_random> {
private:
    RandomWrapper<> m_random;
    std::mutex m_mutex;
    std::atomic<int> m_poll_interval{1}; // shouldn't access poll_interval.get() directly on timer thread

    static const inline auto MODE_DESCR = Inlets::value(Types::number,
        "uniform (0), weighted (1), exponential (2) or brownian (3)");

    static const inline auto SIZE_DESCRIPTION = Inlets::voice(Types::number
        , "Set number of random values for each voice to output");

    static const inline auto QUANTIZATION_DESCR = Inlets::voice(Types::index
        , "Set number of quantized output values");

    static const inline auto WEIGHTS_DESCR = Inlets::voices(Types::number, "Set weights");

    static const inline auto BROWNIAN_STEP_DESCR = Inlets::voice(Types::number,
        "Maximum step size for brownian motion");

    static const inline auto LOWER_BOUND_DESCR = Inlets::voice(Types::number,
        "Lower bound for exponential random. A lower value will yield a higher density towards zero.");

    using Rnd = RandomHandler;

public:
    MIN_DESCRIPTION{"Generate random values in range [0, 1)"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phase, ser.pattern, ser.pulse"};

    inlet<> inlet_main{this , Inlets::trigger_info("Trigger output (when polling is disabled)")
                       , "" , [this] { return inlet_is_hot(); }};

    inlet<> inlet_size{this, SIZE_DESCRIPTION, "", false};
    inlet<> inlet_quantization{this, QUANTIZATION_DESCR, "", false};
    inlet<> inlet_weights{this, WEIGHTS_DESCR, "", false};

    outlet<> outlet_main{this, Inlets::voices(Types::number, "Random output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    SER_ENABLED_ATTRIBUTE(m_random.enabled, &m_mutex);
    SER_NUM_VOICES_ATTRIBUTE(m_random.num_voices, &m_mutex);
    SER_AUTO_RESTORE_ATTRIBUTE();


    timer<> metro { this, MIN_FUNCTION {
        if (m_poll_interval > 0) {
            process({});

            metro.delay(m_poll_interval);
            return {};
        }

        metro.delay(1.0);
        return {};
    }
    };


    value_attribute<Rnd::Mode> mode{this, "mode", m_random.mode, Rnd::DEFAULT_MODE, cerr, "", &m_mutex, MODE_DESCR};


    value_attribute<Rnd::AvoidRepetitions> repetitions{this, "repetitions", m_random.repetition_strategy
        , Rnd::DEFAULT_REPETITIONS, cerr , "", &m_mutex};

    vector_attribute<std::size_t, int> size{this, "size", m_random.chord_size
        , Rnd::DEFAULT_CHORD_SIZE, cerr , "", &m_mutex, SIZE_DESCRIPTION};


    value_attribute<double> step{this, "step", m_random.max_brownian_step
        , Rnd::DEFAULT_BROWNIAN_STEP, cerr, "", &m_mutex, BROWNIAN_STEP_DESCR};

    value_attribute<double> lower_bound{this, "lowerbound", m_random.exp_lower_bound
        , Rnd::DEFAULT_EXP_LOWER_BOUND , cerr, "Lower Bound", &m_mutex, LOWER_BOUND_DESCR};

    vector_attribute<std::size_t, int> quantization{this, "quantization", m_random.num_quantization_steps
        , Rnd::DEFAULT_QUANTIZATION, cerr, "", &m_mutex};


    vector_attribute<double> weights{this, "weights", m_random.weights
        , {1.0} , cerr, "", &m_mutex};

    attribute<int> poll_interval{ this, "pollinterval", 1, Descriptions::POLL_INTERVAL, setter{
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
        s >> enabled >> mode >> repetitions >> size >> step >> lower_bound >> quantization >> weights >> poll_interval;

        metro.delay(0);
        return {};
    }}
    };


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << mode << repetitions << size << step << lower_bound << quantization << weights << poll_interval;
    });


    function handle_input = MIN_FUNCTION {
        if (inlet == 3) { // NOLINT(*-branch-clone)
            weights.set(args);
        }
        if (inlet == 2) {
            quantization.set(args);
        } else if (inlet == 1) {
            size.set(args);
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

    void process(const atoms& atms) {
        auto time = SerialistTransport::get_instance().get_time();

        if (!time.get_transport_running()) {
            return;
        }

        // CRITICAL SECTION

        std::unique_lock lock(m_mutex);

        auto& trigger = m_random.trigger;

        if (atms.empty()) {
            // bang / poll trigger: trigger all voices
            trigger.set_values(Voices<Trigger>::singular(Trigger::pulse_on()));
        } else {
            auto triggers = AtomParser::atoms2triggers(atms, false);

            if (!triggers || triggers->is_empty_like()) {
                return;
            }

            trigger.set_values(*triggers);
        }

        auto& node = m_random.random;
        node.update_time(time);
        auto output = node.process();

        trigger.set_values(Voices<Trigger>::empty_like());

        lock.unlock();

        // CRITICAL SECTION END

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }

    bool inlet_is_hot() const {
        return m_poll_interval == 0;
    }

};


MIN_EXTERNAL(ser_random);
