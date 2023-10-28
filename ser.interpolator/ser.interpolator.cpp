
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


    Result<c74::min::atoms> process_trigger(const atoms& args) {}


    Result<c74::min::atoms> process_cursor(const atoms& args) {}


    Result<void> set_strategy_type(const atoms& args) {}


    Result<void> set_enabled(const atoms& args) {}


    Result<void> set_num_voices(const atoms& args) {}


    Result<void> set_auto_trigger(const atoms& args) {}


protected:
    virtual std::optional<c74::min::atoms> process_internal(const atoms& args) = 0;

    ParameterHandler m_parameter_handler;

    Sequence<Trigger> m_trigger{InterpolatorKeys::TRIGGER, m_parameter_handler};
    Sequence<Facet, double> m_cursor{InterpolatorKeys::CURSOR, m_parameter_handler};
    Sequence<Facet, double> m_strategy_type{InterpolationAdapter<std::size_t>::STRATEGY, m_parameter_handler};

    Sequence<Facet, bool> m_enabled{ParameterKeys::ENABLED, m_parameter_handler, Voices<bool>::singular(true)};
    Variable<Facet, std::size_t> m_num_voices{ParameterKeys::NUM_VOICES, m_parameter_handler, 1};


};

class MaxInterpolatorIntegral : public MaxInterpolatorBase {
    Result<void> set_corpus(const c74::min::atoms& args) override {}


    Result<void> set_strategy_pivot(const c74::min::atoms& args) override {}


protected:
    std::optional<c74::min::atoms> process_internal(const c74::min::atoms& args) override {}


private:
    Sequence<Facet, long> m_corpus{InterpolatorKeys::CORPUS, m_parameter_handler};
    Sequence<Facet, long> m_strategy_pivot{InterpolationAdapter<Facet>::PIVOT, m_parameter_handler};
    InterpolationAdapter<Facet> m_strategy{InterpolationAdapter<Facet>::CLASS_NAME
                                           , m_parameter_handler, &m_strategy_type, &m_strategy_pivot};

    InterpolatorNode<Facet> interpolator{InterpolatorKeys::CLASS_NAME, m_parameter_handler, &m_trigger
                                         , &m_cursor, &m_corpus, &m_strategy, &m_enabled, &m_num_voices};
};

class MaxInterpolatorFloating : public MaxInterpolatorBase {
    Result<void> set_corpus(const c74::min::atoms& args) override {}


    Result<void> set_strategy_pivot(const c74::min::atoms& args) override {}


protected:
    std::optional<c74::min::atoms> process_internal(const c74::min::atoms& args) override {}
};

class MaxInterpolatorSymbol : public MaxInterpolatorBase {
    Result<void> set_corpus(const c74::min::atoms& args) override {}


    Result<void> set_strategy_pivot(const c74::min::atoms& args) override {}


protected:
    std::optional<c74::min::atoms> process_internal(const c74::min::atoms& args) override {}


private:
    Sequence<std::string> m_corpus{InterpolatorKeys::CORPUS, m_parameter_handler};
    InterpolationAdapter<std::string> m_strategy{InterpolationAdapter<Facet>::CLASS_NAME
                                                 , m_parameter_handler, &m_strategy_type, nullptr};

    InterpolatorNode<std::string> interpolator{InterpolatorKeys::CLASS_NAME, m_parameter_handler, &m_trigger
                                               , &m_cursor, &m_corpus, &m_strategy, &m_enabled, &m_num_voices};
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
    inlet<> inlet_corpus{this, "(list/listoflists) corpus"};
    inlet<> inlet_cursor{this, "(float/list) cursor"};

    outlet<> outlet_main{this, "(float/list) pulse output"};
    outlet<> dumpout{this, "(any) dumpout"};


    explicit interpolator(const atoms& args = {}) {
        if (args.empty()) {
            error("missing type specification (i/f/s)");
        }

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
            cwarn << "extra argument for message \"" << this->classname() << "\"" << endl;
        }
    }


    attribute<std::vector<int>> strategy{this, "strategy"
                                         , {0}
                                         , title{"Set interpolation strategy"}
                                         , description{""}
                                         , setter{MIN_FUNCTION {
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
                                , title{"Trigger output on cursor inpu"}
                                , setter{MIN_FUNCTION {
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


    message<> list{this, "list", "Function depends on inlet", setter{MIN_FUNCTION {
        handle_messages(args, inlet, false);
        return {};
    }}};


    message<> number{this, "number", "Function depends on inlet", setter{MIN_FUNCTION {
        handle_messages(args, inlet, false);
        return {};
    }}};


    message<> listoflist{this, "[", "Function depends on inlet", setter{MIN_FUNCTION {
        handle_messages(args, inlet, true);
        return {};
    }}};


    // needed for messages beginning with 'null'
    message<> anything{this, "anything", "Function depends on inlet", setter{MIN_FUNCTION {
        handle_messages(args, inlet, false);
        return {};
    }}};

private:

    void handle_messages(const atoms& args, int inlet, bool is_list_of_lists) {
        if (inlet == 2) {
            update_cursor(args, is_list_of_lists);
        } else if (inlet == 1) {
            update_corpus(args, is_list_of_lists);
        } else {
            update_triggers(args, is_list_of_lists);
        }
    }


    void update_cursor(const atoms& args, bool is_list_of_lists) {
        if (auto result = m_interpolator->set_auto_trigger(args)) {
            return args;
        } else {
            cerr << result.err().message() << endl;
            return autotrigger;
        }
    }}
    }


    void update_corpus(const atoms& args, bool is_list_of_lists) {

    }


    void update_triggers(const atoms& args, bool is_list_of_lists) {

    }


};


MIN_EXTERNAL(interpolator);