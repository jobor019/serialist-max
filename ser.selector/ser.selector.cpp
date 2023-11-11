#include "c74_min.h"
#include "core/generatives/selector.h"
#include "parsing.h"
#include "max_stereotypes.h"


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

    virtual void update_material(const atoms& args) = 0;


    void set_strategy_type(const atoms& args) {
        // SelectorAdapter requires a Facet which it treats in the same manner as enums
        // (values mapped to range(0.0, 1.0), hence the type acrobatics here
        auto strategy_as_doubles = AtomParser::atoms2vec<int>(args)
                .ok()
                .cloned()
                .as_type<double>([](const int index) {
                    return utils::index2double(static_cast<std::size_t>(index), SelectionStrategy::count());
                });
        std::cout << "STRATEL: ";
        strategy_as_doubles.print();
        m_strategy_type.set_values(Voices<double>::transposed(strategy_as_doubles));
    }


    void set_nth_indices(const atoms& args) {
        AttributeSetters::set_vector(args, m_nth_indices);
    }


    void set_num_random(const atoms& args) {
        AttributeSetters::set_vector(args, m_num_random);
    }


    void set_enabled(const atoms& args) {
        AttributeSetters::set_value<bool>(args, m_enabled);
    }


    void set_num_voices(const atoms& args) {
        AttributeSetters::set_value<std::size_t, int>(args, m_num_voices);
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
    Result<c74::min::atoms> process_trigger(const atoms& args) override {
        if (auto triggers = AtomParser::atoms2triggers(args)) {
            m_trigger.set_values(*triggers);
            m_last_update_time += 1.0;

            // Actual time irrelevant, just need a new value for time gating
            m_selector.update_time(TimePoint(m_last_update_time));
            auto voices = m_selector.process();
            return AtomFormatter::voices2atoms<StoredType>(voices);

        } else {
            return triggers.err();
        }
    }


    void update_material(const atoms& args) override {
        AttributeSetters::set_voices<StoredType>(args, m_material);
    }


private:
    Sequence<OutputType, StoredType> m_material{SelectorKeys::MATERIAL, m_parameter_handler};

    SelectorNode<OutputType> m_selector{SelectorKeys::CLASS_NAME, m_parameter_handler, &m_trigger, &m_material
                                        , &m_strategy, &m_enabled, &m_num_voices};

    double m_last_update_time = 0.0;

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

    inlet<> inlet_main{this, "(anything) control messages"};
    inlet<> inlet_material{this, "(list) material"};

    outlet<> outlet_main{this, "(anything) selection"};
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


    attribute<std::vector<int>> strategy{this, "strategy"
                                         , {0}
                                         , title{"Selection strategy"}
                                         , setter{MIN_FUNCTION {
                return generic_setter(args, &MaxSelectorBase::set_strategy_type, strategy);
            }}
    };


    attribute<std::vector<int>> nths{this, "nths"
                                     , {0}
                                     , title{"Indices (nth strategy)"}
                                     , setter{MIN_FUNCTION {
                return generic_setter(args, &MaxSelectorBase::set_nth_indices, nths);
            }}};


    attribute<std::vector<int>> nrand{this, "nrand"
                                      , {1}
                                      , title{"Number of selections (random strategy)"}
                                      , setter{MIN_FUNCTION {
                return generic_setter(args, &MaxSelectorBase::set_num_random, nrand);
            }}
    };


    attribute<bool> enabled{this, "enabled"
                            , true
                            , title{"Set enabled"}
                            , setter{MIN_FUNCTION {
                return generic_setter(args, &MaxSelectorBase::set_enabled, enabled);
            }}
    };


    attribute<int> voices{this, "voices"
                          , 0
                          , title{"Set number of voices"}
                          , setter{MIN_FUNCTION {
                return generic_setter(args, &MaxSelectorBase::set_num_voices, voices);
            }}
    };


    message<> material{this, "material", "Selection material", setter{MIN_FUNCTION {
        update_material(args);
        return {};
    }}};


    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 1) {
            update_material(args);
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
        return AttributeSetters::try_call_external_setter(m_selector, setter_func, new_value, current_value, cerr);
    }


    void update_material(const atoms& args) {
        generic_setter(args, &MaxSelectorBase::update_material, {});
    }


    void update_triggers(const atoms& args) {
        if (auto output = m_selector->process_trigger(args)) {
            if (!output->empty()) {
                outlet_main.send(*output);
            }
        } else {
            cerr << *output.err() << endl;
        }
    }


};


MIN_EXTERNAL(selector);