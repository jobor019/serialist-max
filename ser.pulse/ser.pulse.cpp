#include <core/policies/policies.h>
#include <core/generatives/pulsator.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"


using namespace c74::min;
using namespace serialist;

class ser_pulse : public object<ser_pulse> {
private:
    PulsatorWrapper<double> m_pulse;

    std::mutex m_mutex;

public:
    static inline const std::string CLASS_NAME = "pulse";

    MIN_DESCRIPTION{"Pulse generator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.oscillator"};

    inlet<> inlet_main{this, "(any) control messages / trigger)", "float/listoflists"};
    inlet<> inlet_duration{this, "(float/list) duration", "float/listoflists", false};
    inlet<> inlet_legato{this, "(float/list) legato", "float/listoflists", false};

    outlet<> outlet_main{this, "pulse", "int/listoflists"};
    outlet<> dumpout{this, "(any) dumpout"};

    explicit ser_pulse(const atoms& = {}) {
        metro.delay(1.0);
    }

    timer<> metro{this, MIN_FUNCTION {
        on_callback();
        metro.delay(1.0);
        return {};
    }};

    attribute<symbol> clock{this, Keywords::CLOCK
                            , ""
                            , title{Titles::CLOCK}
                            , description{Descriptions::CLOCK}};


    attribute<bool> enabled{this, Keywords::ENABLED
                            , true
                            , title{Titles::ENABLED}
                            , description{Descriptions::ENABLED}
                            , setter{MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                if (AttributeSetters::try_set_value(args, m_pulse.enabled, cerr))
                    return args;
                return enabled;
            }}
    };


    attribute<int> voices{this, Keywords::NUM_VOICES
                          , 0
                          , title{Titles::NUM_VOICES}
                          , description{Descriptions::ENABLED}
                          , setter{MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                if (AttributeSetters::try_set_value(args, m_pulse.num_voices, cerr))
                    return args;
                return voices;
            }}
    };

    attribute<std::vector<double>> duration{this, "duration"
                                            , Vec<double>::singular(PulsatorParameters::DEFAULT_DURATION).vector()
                                            , title{"duration"}
                                            , setter{MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                if (AttributeSetters::try_set_vector(args, m_pulse.duration, cerr))
                    return args;
                return duration;
            }}
    };

    attribute<int> durationtype{this, "durationtype"
                                , static_cast<int>(PulsatorParameters::DEFAULT_DURATION_TYPE)
                                , title{"duration type"}
                                , setter{MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                if (AttributeSetters::try_set_value(args, m_pulse.duration_type, cerr))
                    return args;
                return durationtype;
            }}
    };


    attribute<std::vector<double>> offset{this, "offset"
                                          , Vec<double>::singular(PulsatorParameters::DEFAULT_OFFSET).vector()
                                          , title{"offset"}
                                          , setter{MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                if (AttributeSetters::try_set_vector(args, m_pulse.offset, cerr))
                    return args;
                return offset;
            }}
    };


    attribute<int> offsettype{this, "offsettype"
                              , static_cast<int>(PulsatorParameters::DEFAULT_OFFSET_TYPE)
                              , title{"offset type"}
                              , setter{MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                if (AttributeSetters::try_set_value(args, m_pulse.offset_type, cerr))
                    return args;
                return offsettype;
            }}
    };


    attribute<int> mode{this, "mode"
                        , static_cast<int>(Pulsator::DEFAULT_MODE)
                        , title{"offset enabled"}
                        , setter{MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                if (AttributeSetters::try_set_value(args, m_pulse.mode, cerr))
                    return args;
                return mode;
            }}
    };


    attribute<std::vector<double>> legato{this, "legato"
                                          , Vec<double>::singular(PulsatorParameters::DEFAULT_LEGATO_AMOUNT).vector()
                                          , title{"legato"}
                                          , setter{MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                if (AttributeSetters::try_set_vector(args, m_pulse.legato_amount, cerr))
                    return args;
                return legato;
            }}
    };


    attribute<bool> hold{this, "hold"
                         , PulsatorParameters::DEFAULT_SNH
                         , title{"sample and hold"}
                         , setter{MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                if (AttributeSetters::try_set_vector(args, m_pulse.sample_and_hold, cerr))
                    return args;
                return hold;
            }}
    };


    message<> flush{this, Keywords::FLUSH
                    , description{Descriptions::FLUSH}
                    , MIN_FUNCTION {
                if (inlet != 0) {
                    return {};
                }

                std::lock_guard lock{m_mutex};
                cwarn << "flush not implemented yet" << endl;
                return {};
            }};


    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            legato.set(args);
        } else if (inlet == 1) {
            duration.set(args);
        } else {
            process_incoming_triggers(args);
        }

        return {};
    };


    message<> bang = Messages::bang_message(this, handle_input);
    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);


private:
    void on_callback() {
        auto time = MaxTimePoint::get_time_point_of(clock.get());
        if (!time) {
            cerr << *time.err() << endl;
            return;
        }

        // CRITICAL SECTION: BEGIN //

        std::unique_lock lock(m_mutex, std::try_to_lock); // try_to_lock: we can ignore this iteration if busy
        if (!lock.owns_lock()) {
            return;
        }

        auto triggers = process_unsafe(*time);

        lock.unlock();

        // CRITICAL SECTION: END //

        TriggerStereotypes::output_as_triggers_sorted(triggers, outlet_main, cerr);
    }

    void process_incoming_triggers(const atoms& atms) {
        if (auto incoming_triggers = AtomParser::atoms2triggers(atms, true)) {

            auto time = MaxTimePoint::get_time_point_of(clock.get());
            if (!time) {
                cerr << time.err() << endl;
                return;
            }

            // CRITICAL SECTION: BEGIN //

            std::unique_lock lock{m_mutex}; // should not try_to_lock, important to get output in same scheduler cycle
            m_pulse.trigger.set_values(*incoming_triggers);
            auto outgoing_triggers = process_unsafe(*time);

            lock.unlock();

            // CRITICAL SECTION: END //

            TriggerStereotypes::output_as_triggers_sorted(outgoing_triggers, outlet_main, cerr);
        } else {
            cerr << incoming_triggers.err() << endl;
        }
    }


    Voices<Trigger> process_unsafe(const TimePoint& t) {
        m_pulse.pulsator_node.update_time(t);
        auto output = m_pulse.pulsator_node.process();

        m_pulse.trigger.set_values(Voices<Trigger>::empty_like()); // remove any processed incoming trigger
        return output;
    }
};


MIN_EXTERNAL(ser_pulse);