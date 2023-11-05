#include "c74_min.h"
#include "core/generatives/selector.h"
#include "parsing.h"


using namespace c74::min;

class MaxSelectorBase {
public:
    MaxSelectorBase() = default;
    virtual ~MaxSelectorBase() = default;
    MaxSelectorBase(const MaxSelectorBase&) = delete;
    MaxSelectorBase& operator=(const MaxSelectorBase&) = delete;
    MaxSelectorBase(MaxSelectorBase&&) noexcept = delete;
    MaxSelectorBase& operator=(MaxSelectorBase&&) noexcept = delete;


    virtual Result<c74::min::atoms> process_trigger(const atoms& args) = 0;

    virtual Result<c74::min::atoms> update_material(const atoms& args, bool trigger_output) = 0;


    Result<void> set_strategy_type(const atoms& args) {
        (void) args;
        return {};
    }


    Result<void> set_nth_indices(const atoms& args) {
        (void) args;
        return {};
    }


    Result<void> set_num_random(const atoms& args) {
        (void) args;
        return {};
    }


    Result<void> set_enabled(const atoms& args) {
        (void) args;
        return {};
    }


    Result<void> set_num_voices(const atoms& args) {
        (void) args;
        return {};
    }


protected:
    ParameterHandler m_parameter_handler;

    Sequence<Trigger> m_trigger{ParameterKeys::TRIGGER, m_parameter_handler};


    Sequence<Facet, double> m_strategy_type{SelectorKeys::STRATEGY, m_parameter_handler};
    Sequence<Facet, long> m_nth_indices{SelectorAdapter::INDICES, m_parameter_handler};
    Sequence<Facet, std::size_t> m_num_random{SelectorAdapter::NUM_RANDOM, m_parameter_handler};
    SelectorAdapter m_strategy{SelectorKeys::STRATEGY, m_parameter_handler
                               , &m_strategy_type, &m_nth_indices, &m_num_random};

    Sequence<Facet, bool> m_enabled{ParameterKeys::ENABLED, m_parameter_handler, Voices<bool>::singular(true)};
    Variable<Facet, std::size_t> m_num_voices{ParameterKeys::NUM_VOICES, m_parameter_handler, 1};

};

template<typename OutputType, typename StoredType = OutputType>
class MaxSelectorGeneric : public MaxSelectorBase {
public:
    Result<c74::min::atoms> process_trigger(const atoms& args) {
        (void) args;
        return Error("Not implemented"); // TODO
    }


    Result<c74::min::atoms> update_material(const atoms& args, bool trigger_output = false) {
        (void) args, (void) trigger_output;
        return Error("Not implemented"); // TODO
    }


private:
    Sequence<OutputType, StoredType> m_material{SelectorKeys::MATERIAL, m_parameter_handler};

    SelectorNode<OutputType> m_selector{SelectorKeys::CLASS_NAME, m_parameter_handler, &m_trigger, &m_material
                                        , &m_strategy, &m_enabled, &m_num_voices};

};

using MaxSelectorInt = MaxSelectorGeneric<Facet, long>;
using MaxSelectorFloat = MaxSelectorGeneric<Facet, double>;
using MaxSelectorSymbol = MaxSelectorGeneric<std::string>;


// ==============================================================================================

class selector : public object<selector> {
private:
    std::unique_ptr<MaxSelectorBase> m_selector;


public:
    MIN_DESCRIPTION{"Mujlti-channel selector"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{""};

    inlet<> inlet_main{this, "(anything) an inlet"};

    outlet<> outlet_main{this, "(anything) an outlet"};
    outlet<> dumpout{this, "(anything) dumpout"};


    explicit selector(const atoms& args = {}) {
        if (!args.empty()) {
            if (auto type_spec = AtomParser::atoms2value<std::string>(args)) {
                if (*type_spec == "i" || *type_spec == "int") {
                    m_selector = std::make_unique<MaxSelectorInt>();
                } else if (*type_spec == "f" || *type_spec == "float") {
                    m_selector = std::make_unique<MaxSelectorFloat>();
                } else if (*type_spec == "s" || *type_spec == "symbol") {
                    m_selector = std::make_unique<MaxSelectorSymbol>();
                } else {
                    error("Unknown selector type: " + *type_spec);
                }
            } else {
                error("Type specification must be a symbol (i/f/s)");
            }

            if (args.size() > 1) {
                cwarn << "extra argument for message \"ser.selector\"" << endl;
            }
        } else {
            error("No type specified");
        }
    }


    attribute<bool> enabled{this, "enabled"
                            , true
                            , title{"Set enabled"}
                            , setter{MIN_FUNCTION {
                return generic_setter(&MaxSelectorBase::set_enabled, args, enabled);
            }}};

    attribute<int> voices{this, "voices"
                          , 0
                          , title{"Set number of voices"}
                          , setter{MIN_FUNCTION {
                return generic_setter(&MaxSelectorBase::set_num_voices, args, voices);
            }}
    };

    //    attribute<std::vector<int>> triggers{};
//    attribute<std::vector<

private:

    // TODO
    class ResultError;

    template<typename SetterPtr>
    c74::min::atoms generic_setter(SetterPtr setter_ptr
                                   , const c74::min::atoms& args
                                   , const c74::min::atoms& current_value) {
        if (!m_selector)
            return args;

        try {
            ((*m_selector).*setter_ptr)(args);
            return args;
        } catch (const ResultError& e) {
            cerr << e.message() << endl;
            return current_value;
        }

//        if (auto result = ((*m_selector).*setter_ptr)(args)) {
//            return args;
//        } else {
//            cerr << result.err().message() << endl;
//            return current_value;
//        }
    }


};


MIN_EXTERNAL(selector);