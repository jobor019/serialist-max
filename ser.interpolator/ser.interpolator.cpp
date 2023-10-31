
#include "c74_min.h"


#include "parsing.h"
#include "max_timepoint.h"

#include "core/generatives/interpolator.h"

using namespace c74::min;

class MaxInterpolatorBase {
public:
    MaxInterpolatorBase() = default;
    virtual ~MaxInterpolatorBase() = default;
    MaxInterpolatorBase(const MaxInterpolatorBase&) = delete;
    MaxInterpolatorBase& operator=(const MaxInterpolatorBase&) = delete;
    MaxInterpolatorBase(MaxInterpolatorBase&&) noexcept = delete;
    MaxInterpolatorBase& operator=(MaxInterpolatorBase&&) noexcept = delete;

    virtual Result<void> set_corpus(const atoms& args) = 0;
    virtual Result<void> set_strategy_pivot(const atoms& args) = 0;


    Result<c74::min::atoms> process_trigger(const atoms& args) {
        if (auto triggers = AtomParser::atoms2triggers(args)) {
            m_trigger.set_values(*triggers);
            return process_internal();
        } else {
            return triggers.err();
        }
    }


    Result<c74::min::atoms> process_cursor(const atoms& args) {
        if (auto cursor = AtomParser::atoms2vec<double>(args)) {
            auto cursor_as_voices = Voices<double>::transposed(*cursor);
            m_cursor.set_values(cursor_as_voices);

            if (m_auto_trigger) {
                auto triggers = Voices<Trigger>::zeros(cursor_as_voices.size());
                for (std::size_t i = 0; i < cursor_as_voices.size(); ++i) {
                    if (!cursor_as_voices[i].empty()) {
                        triggers[i].append(Trigger::pulse_on);
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

            auto strategy_as_doubles = strategy_indices.ok().as_type<double>([](const int index) {
                return InterpolationAdapter<int>::index2double(static_cast<std::size_t>(index));
            });
            m_strategy_type.set_values(Voices<double>::transposed(strategy_as_doubles));
            return {};

        } else {
            return strategy_indices.err();
        }
    }


    Result<void> set_enabled(const atoms& args) {
        if (auto v = AtomParser::atoms2value<bool>(args)) {
            m_enabled.set_values(*v);
            return {};
        } else {
            return v.err();
        }
    }


    Result<void> set_num_voices(const atoms& args) {
        if (auto v = AtomParser::atoms2value<int>(args)) {
            m_num_voices.set_value(static_cast<std::size_t>(*v));
            return {};
        } else {
            return v.err();
        }
    }


    Result<void> set_auto_trigger(const atoms& args) {
        if (auto v = AtomParser::atoms2value<bool>(args)) {
            m_auto_trigger = *v;
            return {};
        } else {
            return v.err();
        }
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
    Result<void> set_corpus(const c74::min::atoms& args) override {
        if (auto corpus = AtomParser::atoms2voices<StoredType>(args)) {
            m_corpus.set_values(*corpus);
            return {};
        } else {
            return corpus.err();
        }
    }


    Result<void> set_strategy_pivot(const c74::min::atoms& args) override {
        if (auto pivot = AtomParser::atoms2value<StoredType>(args)) {
            m_strategy_pivot.set_values(*pivot);
            return {};
        } else {
            return pivot.err();
        }
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

class MaxInterpolatorIntegral : public MaxInterpolatorGeneric<long, Facet> {};

class MaxInterpolatorFloating  : public MaxInterpolatorGeneric<double, Facet> {};

class MaxInterpolatorSymbol : public MaxInterpolatorGeneric<std::string, std::string> {};


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
    inlet<> inlet_cursor{this, "(float/list) cursor", "", [this](){return cursor_inlet_is_hot(); }};

    outlet<> outlet_main{this, "(float/list) pulse output"};
    outlet<> dumpout{this, "(any) dumpout"};


    explicit interpolator(const atoms& args = {}) {
        // Note: ctor is called twice by min api where error() will only fail on the second pass,
        // hence the inverted logic here is necessary
        if (!args.empty()) {
            if (args[0].type() == c74::min::message_type::symbol_argument) {
                auto type = static_cast<std::string>(args[0]);
                if (type == "i" || type == "int") {
                    m_interpolator = std::make_unique<MaxInterpolatorIntegral>();
                } else if (type == "f" || type == "float") {
                    m_interpolator = std::make_unique<MaxInterpolatorFloating>();
                } else if (type == "s" || type == "symbol") {
                    m_interpolator = std::make_unique<MaxInterpolatorSymbol>();
                } else {
                    error("invalid type specification");
                }
            } else {
                error("type specification must be a symbol (i/f/s)");
            }

            if (args.size() > 1) {
                // TODO: Not sure if this->classname() is defined at this point!!!
                cwarn << "extra argument for message \"ser.interpolator\"" << endl;
            }
        } else {
            c74::min::error("missing type specification (i/f/s)");
        }
    }


    attribute<std::vector<int>> strategy{this, "strategy"
                                         , {0}
                                         , title{"Set interpolation strategy"}
                                         , description{""}
                                         , setter{MIN_FUNCTION {
                if (!m_interpolator) {
                    return args; // max ctor hasn't been called yet
                }

                if (auto result = m_interpolator->set_strategy_type(args)) {
                    return args;
                } else {
                    cerr << result.err().message() << endl;
                    return strategy;
                }
            }}
    };


    attribute<bool> enabled{this, "enabled"
                            , true
                            , title{"Set enabled"}
                            , setter{MIN_FUNCTION {
                if (!m_interpolator) {
                    return args; // max ctor hasn't been called yet
                }

                if (auto result = m_interpolator->set_enabled(args)) {
                    return args;
                } else {
                    cerr << result.err().message() << endl;
                    return enabled;
                }
            }}
    };


    attribute<int> voices{this, "voices"
                          , 0
                          , title{"Set number of voices"}
                          , setter{MIN_FUNCTION {
                if (!m_interpolator) {
                    return args; // max ctor hasn't been called yet
                }

                if (auto result = m_interpolator->set_num_voices(args)) {
                    return args;
                } else {
                    cerr << result.err().message() << endl;
                    return voices;
                }
            }}
    };

    attribute<bool> autotrigger{this, "autotrigger"
                                , false
                                , title{"Trigger output on cursor input"}
                                , setter{MIN_FUNCTION {
                if (!m_interpolator) {
                    return args; // max ctor hasn't been called yet
                }

                if (auto result = m_interpolator->set_auto_trigger(args)) {
                    return args;
                } else {
                    cerr << result.err().message() << endl;
                    return autotrigger;
                }
            }}
    };


    // message rather than attribute since it should accept either a list of symbols or a list of ints/floats
    message<> pivot{this, "pivot", "Set pivot for strategy 'continue'", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"pivot\" for inlet " << inlet << endl;
        }

        if (auto result = m_interpolator->set_strategy_pivot(args)) {
            return {};
        } else {
            cerr << result.err().message() << endl;
            return {};
        }
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


    message<> list{this, "list", "Function depends on inlet", handle_input};


    message<> number{this, "number", "Function depends on inlet", handle_input};


    message<> listoflist{this, "[", "Function depends on inlet", setter{MIN_FUNCTION {
        auto formatted = AtomParser::prepend_leading_bracket(args);
        handle_input(formatted, inlet);
        return {};
    }}};


    // needed for messages beginning with 'null'
    message<> anything{this, "anything", "Function depends on inlet", handle_input};


private:

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
        auto result = m_interpolator->set_corpus(args);
        if (!result) {
            cerr << *result.err() << endl;
        }
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

    bool cursor_inlet_is_hot() {
        if (m_interpolator) {
            return m_interpolator->get_auto_trigger();
        }
        return false;
    }


};


MIN_EXTERNAL(interpolator);