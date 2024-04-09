
#include "c74_min.h"


#include "parsing.h"
#include "max_timepoint.h"

#include "core/generatives/interpolator.h"
#include "max_stereotypes.h"

using namespace c74::min;

class MaxInterpolatorBase {
public:
    MaxInterpolatorBase() = default;

    virtual ~MaxInterpolatorBase() = default;

    MaxInterpolatorBase(const MaxInterpolatorBase&) = delete;

    MaxInterpolatorBase& operator=(const MaxInterpolatorBase&) = delete;

    MaxInterpolatorBase(MaxInterpolatorBase&&) noexcept = delete;

    MaxInterpolatorBase& operator=(MaxInterpolatorBase&&) noexcept = delete;

    virtual void set_corpus(const atoms& args) = 0;

    virtual void set_strategy_pivot(const atoms& args) = 0;


    Result<c74::min::atoms> process_trigger(const atoms& args) noexcept {
        if (auto triggers = AtomParser::atoms2triggers(args)) {
            if (Trigger::contains_pulse_on(*triggers)) {
                m_trigger.set_values(*triggers);
                return process_internal();
            }
            return {c74::min::atoms()};
        } else {
            return triggers.err();
        }
    }


    Result<c74::min::atoms> process_cursor(const atoms& args) noexcept {
        if (auto cursor = AtomParser::atoms2vec<double>(args)) {
            auto cursor_as_voices = Voices<double>::transposed(*cursor);
            m_cursor.set_values(cursor_as_voices);

            if (m_auto_trigger) {
                auto triggers = Voices<Trigger>::zeros(cursor_as_voices.size());
                for (std::size_t i = 0; i < cursor_as_voices.size(); ++i) {
                    if (!cursor_as_voices[i].empty()) {
                        triggers[i].append(Trigger::pulse_on());
                    }
                }

                m_trigger.set_values(triggers);

                return process_internal();
            }
            return {c74::min::atoms()};
        } else {
            return cursor.err();
        }
    }


    Result<void> set_strategy_type(const atoms& args) {
        if (auto strategy_indices = AtomParser::atoms2vec<int>(args)) {
            // InterpolationAdapter requires a Facet which it treats in the same manner as enums
            // (values mapped to range(0.0, 1.0), hence the type acrobatics here

            auto strategy_as_doubles = strategy_indices.ok().cloned().as_type<double>([](const int index) {
                return InterpolationAdapter<int>::index2double(static_cast<std::size_t>(index));
            });
            m_strategy_type.set_values(Voices<double>::transposed(strategy_as_doubles));
            return {};

        } else {
            return strategy_indices.err();
        }
    }


    void set_enabled(const atoms& args) {
        AttributeSetters::set_value<bool>(args, m_enabled);
    }


    void set_num_voices(const atoms& args) {
        AttributeSetters::set_value<std::size_t, int>(args, m_num_voices);
    }


    void set_auto_trigger(const atoms& args) {
        m_auto_trigger = AtomParser::atoms2value<bool>(args).ok();
    }


    bool get_auto_trigger() const {
        return m_auto_trigger;
    }


protected:
    virtual c74::min::atoms process_internal() = 0;

    ParameterHandler m_parameter_handler;

    Sequence<Trigger> m_trigger{InterpolatorKeys::TRIGGER, m_parameter_handler};
    Sequence<Facet, double> m_cursor{InterpolatorKeys::CURSOR, m_parameter_handler};
    Sequence<Facet, double> m_strategy_type{InterpolationAdapter<double>::STRATEGY, m_parameter_handler};

    Sequence<Facet, bool> m_enabled{ParameterKeys::ENABLED, m_parameter_handler, Voices<bool>::singular(true)};
    Variable<Facet, std::size_t> m_num_voices{ParameterKeys::NUM_VOICES, m_parameter_handler, 1};

private:
    bool m_auto_trigger = false;


};


// ==============================================================================================

template<typename StoredType, typename OutputType = Facet>
class MaxInterpolatorGeneric : public MaxInterpolatorBase {
public:
    void set_corpus(const c74::min::atoms& args) override {
        AttributeSetters::set_voices<StoredType>(args, m_corpus);

    }


    void set_strategy_pivot(const c74::min::atoms& args) override {
        AttributeSetters::set_vector<StoredType>(args, m_strategy_pivot);
    }


protected:
    c74::min::atoms process_internal() override {
        m_last_update_time += 1.0;
        // Actual time irrelevant, just need a new value for time gating
        m_interpolator.update_time(TimePoint(m_last_update_time));
        auto voices = m_interpolator.process();
        return AtomFormatter::voices2atoms<StoredType>(voices);
    }


private:
    Sequence<OutputType, StoredType> m_corpus{InterpolatorKeys::CORPUS, m_parameter_handler};
    Sequence<OutputType, StoredType> m_strategy_pivot{InterpolationAdapter<Facet>::PIVOT, m_parameter_handler};
    InterpolationAdapter<OutputType> m_strategy{InterpolationAdapter<Facet>::CLASS_NAME
                                                , m_parameter_handler, &m_strategy_type, &m_strategy_pivot};

    InterpolatorNode<OutputType> m_interpolator{InterpolatorKeys::CLASS_NAME, m_parameter_handler, &m_trigger
                                                , &m_cursor, &m_corpus, &m_strategy, &m_enabled, &m_num_voices};

    double m_last_update_time = 0.0;
};

// ==============================================================================================

class MaxInterpolatorIntegral : public MaxInterpolatorGeneric<long, Facet> {
};

class MaxInterpolatorFloating : public MaxInterpolatorGeneric<double, Facet> {
};

class MaxInterpolatorSymbol : public MaxInterpolatorGeneric<std::string, std::string> {
};


// ==============================================================================================

class interpolator : public object<interpolator> {
private:
    // MEMBER VARIABLES (position enforced by c74::min architecture)
    std::unique_ptr<MaxInterpolatorBase> m_interpolator;

public:
    MIN_DESCRIPTION{"Multi-channel memory interpolator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.pulsator"};

    inlet<> inlet_main{this, "(any) control messages"};
    inlet<> inlet_corpus{this, "(list/listoflists) corpus", "", false};
    inlet<> inlet_cursor{this, "(float/list) cursor", "", [this]() { return cursor_inlet_is_hot(); }};

    outlet<> outlet_main{this, "(float/list) interpolated output"};
    outlet<> dumpout{this, "(any) dumpout"};

    static const inline std::string CLASS_NAME = "interpolator";


    explicit interpolator(const atoms& args = {}) {
        if (args.size() > 1) {
            cwarn << ErrorMessages::extra_argument(CLASS_NAME) << endl;
        }

        if (auto type_spec = TypeSpecificationStereotypes::atoms2type_specification(args)) {
            if (*type_spec == c74::min::message_type::int_argument) {
                m_interpolator = std::make_unique<MaxInterpolatorIntegral>();
            } else if (*type_spec == c74::min::message_type::float_argument) {
                m_interpolator = std::make_unique<MaxInterpolatorFloating>();
            } else {
                m_interpolator = std::make_unique<MaxInterpolatorSymbol>();
            }
        } else {
            error(ErrorMessages::format(*type_spec.err(), CLASS_NAME));
        }
    }


    attribute<std::vector<int>> strategy{this, "strategy"
                                         , {0}
                                         , title{"Interpolation strategy"}
                                         , description{""}
                                         , setter{MIN_FUNCTION {
                return generic_setter(args, &MaxInterpolatorBase::set_strategy_type, strategy);
            }}
    };


    attribute<bool> enabled{this, Keywords::ENABLED
                            , true
                            , title{Titles::ENABLED}
                            , description{Descriptions::ENABLED}
                            , setter{MIN_FUNCTION {
                return generic_setter(args, &MaxInterpolatorBase::set_enabled, enabled);
            }}
    };


    attribute<int> voices{this, Keywords::NUM_VOICES
                          , 0
                          , title{"Number of voices"}
                          , setter{MIN_FUNCTION {
                return generic_setter(args, &MaxInterpolatorBase::set_num_voices, voices);
            }}
    };


    attribute<bool> autotrigger{this, "autotrigger"
                                , false
                                , title{"Triggers"}
                                , setter{MIN_FUNCTION {
                return generic_setter(args, &MaxInterpolatorBase::set_auto_trigger, autotrigger);
            }}
    };


    // message rather than attribute since it should accept either a list of symbols or a list of ints/floats
    message<> pivot{this, "pivot", "Set pivot for strategy 'continue'", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"pivot\" for inlet " << inlet << endl;
        }

        generic_setter(args, &MaxInterpolatorBase::set_strategy_pivot, {});
        return {};
    }}};


    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            update_cursor(args);
        } else if (inlet == 1) {
            update_corpus(args);
        } else {
            update_triggers(args);
        }
        return {};
    };


    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    template<typename SetterFunc, typename = std::enable_if_t<std::is_member_function_pointer_v<SetterFunc>>>
    const atoms& generic_setter(const atoms& new_value
                                , SetterFunc setter_func
                                , const atoms& current_value) noexcept {
        return AttributeSetters::try_call_external_setter(m_interpolator, setter_func, new_value, current_value, cerr);
    }


    void update_cursor(const atoms& args) {
        if (auto output = m_interpolator->process_cursor(args)) {
            // Empty unless autotrigger = true
            if (!output->empty()) {
                outlet_main.send(*output);
            }
        } else {
            cerr << *output.err() << endl;
        }
    }


    void update_corpus(const atoms& args) {
        generic_setter(args, &MaxInterpolatorBase::set_corpus, {});
    }


    void update_triggers(const atoms& args) {
        if (auto output = m_interpolator->process_trigger(args)) {
            if (!output->empty()) {
                outlet_main.send(*output);
            }
        } else {
            cerr << *output.err() << endl;
        }
    }


    bool cursor_inlet_is_hot() const {
        if (m_interpolator) {
            return m_interpolator->get_auto_trigger();
        }
        return false;
    }


};


MIN_EXTERNAL(interpolator);