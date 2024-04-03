#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "core/generatives/variable_state_pulsator.h"
#include "max_timepoint.h"


using namespace c74::min;

class pulse : public object<pulse> {
private:
    VariableStatePulsatorWrapper<double> m_pulse;

    std::mutex m_mutex;

public:
    static inline const std::string CLASS_NAME = "pulse";

    MIN_DESCRIPTION{"Variable State pulse generator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.oscillator"};

    inlet<> inlet_main{this, "(any) control messages / trigger)", "float/listoflists"};
    inlet<> inlet_duration{this, "(float/list) duration", "float/listoflists", false};
    inlet<> inlet_legato{this, "(float/list) legato", "float/listoflists", false};

    outlet<> outlet_main{this, "pulse", "int/listoflists"};
    outlet<> dumpout{this, "(any) dumpout"};

    explicit pulse(const atoms& = {}) {
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
                if (set_enabled(args))
                    return args;
                return enabled;
            }}
    };


    attribute<int> voices{this, Keywords::NUM_VOICES
                          , 0
                          , title{Titles::NUM_VOICES}
                          , description{Descriptions::ENABLED}
                          , setter{MIN_FUNCTION {
                if (set_num_voices(args))
                    return args;
                return voices;
            }}
    };

    attribute<std::vector<double>> duration{this, "duration"
                                            , Vec<double>::singular(1.0).vector()
                                            , title{"duration"}
                                            , setter{MIN_FUNCTION {
                if (set_duration(args))
                    return args;
                return duration;
            }}};

    attribute<std::vector<double>> legato{this, "legato"
                                          , Vec<double>::singular(1.0).vector()
                                          , title{"legato"}
                                          , setter{MIN_FUNCTION {
                if (set_legato(args))
                    return args;
                return legato;
            }}};

    attribute<bool> hold{this, "hold"
                         , true
                         , title{"sample and hold"}
                         , setter{MIN_FUNCTION {
                if (set_sample_and_hold(args))
                    return args;
                return hold;
            }}};

    attribute<int> mode{this, "mode"
                        , 0
                        , title{"Pulsation Mode"}
                        , description{"TODO"}
                        , setter{MIN_FUNCTION {
                if (auto mode_index = AtomParser::atoms2value<int>(args)) {
                    if (*mode_index == static_cast<int>(VariableStatePulsator::Mode::auto_pulsator)) {
                        m_pulse.pulsator_node.set_trigger(nullptr);
                        m_pulse.pulsator_node.set_duration(&m_pulse.duration);
                    } else if (*mode_index == static_cast<int>(VariableStatePulsator::Mode::triggered_pulsator)) {
                        m_pulse.pulsator_node.set_trigger(&m_pulse.trigger);
                        m_pulse.pulsator_node.set_duration(&m_pulse.duration);
                    } else if (*mode_index == static_cast<int>(VariableStatePulsator::Mode::thru_pulsator)) {
                        m_pulse.pulsator_node.set_trigger(&m_pulse.trigger);
                        m_pulse.pulsator_node.set_duration(nullptr);
                    } else {
                        cerr << "ser.pulse: unknown mode" << endl;
                        return mode;
                    }

                    return args;
                } else {
                    return mode;
                }

            }}};


    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            set_legato(args);
        } else if (inlet == 1) {
            set_duration(args);
        } else {
            // TODO
//            process(args);
        }

        return {};
    };

    message<> bang{this, "bang", MIN_FUNCTION {
        // TODO
        return {};
    }};

    message<> flush{this, Keywords::FLUSH
                    , description{Descriptions::FLUSH}
                    , MIN_FUNCTION {
                std::lock_guard lock{m_mutex};
                cwarn << "flush not implemented yet" << endl;
                return {};
            }};

    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);


private:
    void on_callback() {
        auto time = MaxTimePoint::get_time_point_of(clock.get());
        if (!time) {
            cerr << time.err() << endl;
            return;
        }

        // CRITICAL SECTION: BEGIN //

        std::unique_lock lock(m_mutex, std::try_to_lock);
        if (!lock.owns_lock()) {
            return;
        }

        auto triggers = process_unsafe(*time);

        lock.unlock();

        // CRITICAL SECTION: END //

        TriggerStereotypes::output_triggers_sorted(triggers, outlet_main, cerr);
    }

    Voices<Trigger> process_unsafe(const TimePoint& t) {
        m_pulse.pulsator_node.update_time(t);
        return m_pulse.pulsator_node.process();
    }


    bool set_duration(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_pulse.duration, cerr);
    }

    bool set_legato(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_pulse.legato_amount, cerr);
    }

    bool set_sample_and_hold(const atoms& args) {
        return AttributeSetters::try_set_vector(args, m_pulse.sample_and_hold, cerr);
    }


    bool set_enabled(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_pulse.enabled, cerr);
    }

    bool set_num_voices(const atoms& args) {
        return AttributeSetters::try_set_value(args, m_pulse.num_voices, cerr);
    }


};


MIN_EXTERNAL(pulse);