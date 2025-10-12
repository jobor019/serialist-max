#include <serialist_transport.h>
#include <core/policies/policies.h>
#include "generatives/pulse_filter.h"

#include "c74_min.h"
#include "inlet_triggers.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"


using namespace c74::min;


class ser_pulsefilter : public object<ser_pulsefilter> {
private:
    static const inline auto STATE_DESCRIPTION = Inlets::voice(Types::number, "Set filter state (non-zero = open)");

    PulseFilterWrapper<> m_pulse_filter;

public:
    MIN_DESCRIPTION{""};
    MIN_TAGS{""};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phasepulse, ser.makenote"};

    inlet<> inlet_main{this, Inlets::pulse_info("Pulses to filter/sustain"), "", true};
    inlet<> inlet_filter_state{this, STATE_DESCRIPTION, "", true};

    outlet<> outlet_main{this, Inlets::pulse_info("filtered/sustained pulses")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    SER_ENABLED_ATTRIBUTE(m_pulse_filter.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_pulse_filter.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();


    // TODO(Deprecation): Update docstring: Modes "sustain" and "pause" are deprecated
    value_attribute<bool> immediate{this, "immediate", m_pulse_filter.immediate, PulseFilter::DEFAULT_IMMEDIATE_VALUE, cerr,
    "", nullptr, description{"Set immediate mode on/off."
                             " In immediate mode, the filter state is updated as soon as the filter is opened/closed."
                             " More specifically, when enabled:\n"
                             "   - In mode \"sustain\": output pulse offs immediately when the filter is opened\n"
                             "   - In mode \"pause\": output pulse offs immediately when the filter is closed\n\n"
                             " When disabled:\n"
                             "   - In mode \"sustain\": output all held pulse offs on next incoming pulse off\n"
                             "   - In mode \"pause\": don't output anything on close, let matching pulse offs pass"
                             " through normally while closed"}};


    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices  >> immediate;
    });
    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices  << immediate;
    });


    message<threadsafe::no> flush{this, AttributeNames::FLUSH, description{Descriptions::FLUSH}
        , MIN_FUNCTION {
            if (inlet != 0) {
                return {};
            }

            // We're not using the `flush` Trigger of the PhasePulsator here, since `process` is only called when
            // it receives a cursor value, which may not be the case
            // (cursor disconnected, transport not running, etc.)

            if (auto flushed = m_pulse_filter.pulse_filter_node.flush(); !flushed.is_empty_like()) {
                TriggerStereotypes::output_as_triggers_sorted(flushed, outlet_main, cerr);
            }
            return {};
        }
    };


    function handle_input = MIN_FUNCTION {
        if (inlet == 1) {
            process_filter_state(args);
        } else {
            process_trigger(args);
        }
        return {};
    };


    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void process_filter_state(const atoms& args) {
        if (auto fsd = AtomParser::atoms2vec<double>(args)) {
            // Input in range [0.0, 3.0) where
            //   - 0.0 = pause    (more specifically: [0.0, 1.0))
            //   - 1.0 = open     (more specifically: [1.0, 2.0))
            //   - 2.0 = sustain  (more specifically: [2.0, 3.0))
            // In order to facilitate usage with ser.random (or other signals on [0.0, 1.0)), e.g.
            //   - radiogroup         => default mapping works
            //   - pause/open only    => ser.random * 2
            //   - sustain/open only  => ser.random->scale(1, 3)
            //   - pause/open/sustain => ser.random->ser.op * 3
            auto fs = Voices<PulseFilter::State>::transposed(
                fsd->map([](double v) {
                    return std::clamp(v, 0.0, 3.0) / 3.0;
                })
                .as_type<Facet>()
                .as_type<PulseFilter::State>()
            );

            m_pulse_filter.filter_state.set_values(fs);
            process();
        } else {
            cerr << fsd.err().message() << endl;
        }
    }

    void process_trigger(const atoms& args) {
        if (auto triggers = AtomParser::atoms2triggers(args)) {
            m_pulse_filter.trigger.set_values(*triggers);
            process();
        } else {
            cerr << triggers.err().message() << endl;
        }
    }


    void process() {
        auto time = SerialistTransport::get_instance().get_time();
        if (!time.get_transport_running()) {
            return;
        }

        auto& node = m_pulse_filter.pulse_filter_node;

        // Note: even though we may be calling this twice at almost the same time in case both filter_state and
        //       trigger updates at the same scheduler cycle, this is still fine. The `serialist::TimeGate` is
        //       implemented so that Node::process only can be called once per update_time, but since we're calling
        //       update_time twice in this case, it's fine, and both calls will be processed correctly.
        node.update_time(time);
        auto output = node.process();

        m_pulse_filter.trigger.set_values(Voices<Trigger>::empty_like());

        TriggerStereotypes::output_as_triggers_sorted(output, outlet_main, cerr);
    }
};


MIN_EXTERNAL(ser_pulsefilter);