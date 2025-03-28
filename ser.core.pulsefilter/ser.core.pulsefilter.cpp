#include <serialist_transport.h>
#include <core/policies/policies.h>
#include "generatives/pulse_filter.h"

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"


using namespace c74::min;


class ser_pulsefilter : public object<ser_pulsefilter> {
private:
    PulseFilterWrapper<> m_pulse_filter;

public:
    MIN_DESCRIPTION{""};
    MIN_TAGS{""};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phasepulse, ser.makenote"};

    inlet<> inlet_main{this, "(any) trigger", ""};
    inlet<> inlet_filter_state{this, "(float/list) filter state", ""};

    outlet<> outlet_main{this, "(int/list) pulses"};
    outlet<> dumpout{this, "(any) dumpout"};


    attribute<bool> enabled{this, Keywords::ENABLED
                           , true
                           , title{Titles::ENABLED}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_pulse_filter.enabled, cerr))
                return args;
            return enabled;
        }}
    };

    attribute<int> voices{this, Keywords::NUM_VOICES
                          , 0
                          , title{Titles::NUM_VOICES}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_pulse_filter.num_voices, cerr))
                return args;
            return voices;
        }}
    };


    attribute<int> mode{this, "mode"
                          , static_cast<int>(PulseFilter::DEFAULT_MODE)
                          , title{"Mode"}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_pulse_filter.mode, cerr))
                return args;
            return voices;
        }}
    };


    attribute<bool> immediate{this, "immediate"
                          , PulseFilter::DEFAULT_IMMEDIATE_VALUE
                          , title{"Immediate"}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_pulse_filter.immediate, cerr))
                return args;
            return voices;
        }}
    };



    message<> filterstate{this, "filterstate"
        , MIN_FUNCTION {
            this->set_filter_state(args);
            this->process();
            return {};
    }};


    message<> trigger{this, "trigger", MIN_FUNCTION {
        this->set_trigger(args);
        this->process();
        return {};
    }};


    message<threadsafe::no> flush{this, Keywords::FLUSH
                    , description{Descriptions::FLUSH}
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
            this->set_filter_state(args);
        } else {
            this->set_trigger(args);
        }
        this->process();

        return {};
    };


    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void set_filter_state(const atoms& args) {
        AttributeSetters::try_set_vector(args, m_pulse_filter.filter_state, cerr);
    }

    void set_trigger(const atoms& args) {
        if (auto triggers = AtomParser::atoms2triggers(args)) {
            m_pulse_filter.trigger.set_values(*triggers);
        } else {
            cerr << "doesn't understand " << args[0] << endl;
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