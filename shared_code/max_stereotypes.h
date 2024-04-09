
#ifndef SERIALIST_MAX_MAX_STEREOTYPES_H
#define SERIALIST_MAX_MAX_STEREOTYPES_H

#include "c74_min_api.h"
#include "result.h"
#include "parsing.h"
#include "core/generatives/sequence.h"
#include "core/generatives/variable.h"

class Keywords {
public:
    Keywords() = delete;

    static inline const std::string ENABLED = "enabled";
    static inline const std::string NUM_VOICES = "voices";
    static inline const std::string TRIGGERS = "triggers";

    static inline const std::string CLOCK = "clock";
    static inline const std::string FLUSH = "flush";
    static inline const std::string BANG = "bang";

    static inline const std::string TYPE_SPEC = "type";

};


class Titles {
public:
    Titles() = delete;

    static inline const c74::min::title ENABLED = "Enabled";
    static inline const c74::min::title NUM_VOICES = "Number of voices";
    static inline const c74::min::title TRIGGERS = "Triggers";

    static inline const c74::min::title CLOCK = "Clock Source";
    static inline const c74::min::title FLUSH = "Flush";

    static inline const c74::min::title TYPE_SPEC = "Type Specification";
};


// ==============================================================================================

class Descriptions {
public:
    Descriptions() = delete;

    static inline const c74::min::description DEPENDS_ON_INLET = "Function depends on inlet";
    static inline const c74::min::description DEPENDS_ON_INLET_LOL = "(list of lists) Function depends on inlet";

    static inline const c74::min::description ENABLED = "Toggles the object's active mode. "
                                                        "When the active attribute is set to 0, "
                                                        "the object will not output anything when triggered";

    static inline const c74::min::description NUM_VOICES = "Num Voices: TODO"; // TODO

    static inline const c74::min::description CLOCK = "Set clock source";
    static inline const c74::min::description FLUSH = "Flush: TODO";

    static inline const c74::min::description TYPE_SPEC = "Type Specification (i/f/s)";
};

// ==============================================================================================


class ErrorMessages {
public:
    ErrorMessages() = delete;

    static inline const std::string CLOCK_SOURCE_UNKNOWN = "unknown clock source";

    static inline const std::string TYPE_SPEC_INVALID = "invalid type specification (valid: i/f/s)";
    static inline const std::string TYPE_SPEC_WRONG_TYPE = "type specification must be a symbol (i/f/s)";
    static inline const std::string TYPE_SPEC_MISSING = "missing type specification (i/f/s)";

    static std::string extra_argument(const std::string& class_name) {
        return "extra argument for message \"" + class_name + "\"";
    }

    static std::string missing_argument(const std::string& class_name, const std::string& usage_descriptor = "") {
        auto str = class_name + ": missing argument";

        if (!usage_descriptor.empty()) {
            str += " (usage:  " + class_name + " " + usage_descriptor + ")";
        }

        return str;
    }

    static std::string format(const std::string& error_message, const std::string& class_name) {
        return "ser." + class_name + ": " + error_message;
    }
};



// ==============================================================================================


class AttributeSetters {
public:
    AttributeSetters() = delete;

    /**
     * @throws ResultError if parsing fails
     */
    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static void set_value(const c74::min::atoms& args, Variable<OutputType, StoredType>& variable) {
        auto v = AtomParser::atoms2value<ParseType>(args).ok();
        if constexpr (std::is_same_v<ParseType, StoredType>) {
            variable.set_value(v);
        } else {
            variable.set_value(static_cast<StoredType>(v));
        }
    }


    /**
     * @throws ResultError if parsing fails
     */
    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static void set_value(const c74::min::atoms& args, Sequence<OutputType, StoredType>& seq) {
        auto v = AtomParser::atoms2value<ParseType>(args).ok();
        if constexpr (std::is_same_v<ParseType, StoredType>) {
            seq.set_values(v);
        } else {
            seq.set_values(static_cast<StoredType>(v));
        }
    }


    /**
     * @throws ResultError if parsing fails
     */
    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static void set_vector(const c74::min::atoms& args, Sequence<OutputType, StoredType>& seq) {
        auto vec = AtomParser::atoms2vec<ParseType>(args).ok();

        if constexpr (std::is_same_v<ParseType, StoredType>) {
            seq.set_values(Voices<StoredType>::transposed(vec));
        } else {
            seq.set_values(Voices<StoredType>::transposed(vec.template as_type<StoredType>()));
        }
    }


    /**
     * @throws ResultError if parsing fails
     */
    template<typename StoredType, typename ParseType, typename OutputType>
    static void set_vector(const c74::min::atoms& args
                           , Sequence<OutputType, StoredType>& seq
                           , const std::function<StoredType(const ParseType&)>& converter) {
        auto vec = AtomParser::atoms2vec<ParseType>(args).ok();
        auto voices = Voices<StoredType>::transposed(vec.template as_type<StoredType>(converter));
        seq.set_values(voices);
    }


    /**
     * @throws ResultError if parsing fails
     */
    template<typename StoredType, typename OutputType>
    static void set_voices(const c74::min::atoms& args
                           , Sequence<OutputType, StoredType>& seq
                           , bool leading_bracket_stripped = false) {
        auto voices = AtomParser::atoms2voices<StoredType>(args, leading_bracket_stripped).ok();
        voices.print();
        seq.set_values(voices);
    }


    // ==============================================================================================

    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static bool try_set_value(const c74::min::atoms& args
                              , Variable<OutputType, StoredType>& variable
                              , c74::min::logger& cerr) noexcept {
        try {
            set_value(args, variable);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static bool try_set_value(const c74::min::atoms& args
                              , Sequence<OutputType, StoredType>& seq
                              , c74::min::logger& cerr) noexcept {
        try {
            set_value(args, seq);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static bool try_set_vector(const c74::min::atoms& args
                               , Sequence<OutputType, StoredType>& seq
                               , c74::min::logger& cerr) noexcept {
        try {
            set_vector(args, seq);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename ParseType, typename OutputType>
    static bool try_set_vector(const c74::min::atoms& args
                               , Sequence<OutputType, StoredType>& seq
                               , c74::min::logger& cerr
                               , const std::function<StoredType(const ParseType&)>& converter) noexcept {
        try {
            set_vector(args, seq, converter);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename OutputType>
    static bool try_set_voices(const c74::min::atoms& args
                               , Sequence<OutputType, StoredType>& seq
                               , c74::min::logger& cerr
                               , bool leading_bracket_stripped = false) noexcept {
        try {
            set_voices(args, seq, leading_bracket_stripped);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    // ==============================================================================================

    template<typename ObjectType
             , typename SetterFunc = void (ObjectType::*)(const c74::min::atoms&)
             , typename = std::enable_if_t<std::is_member_function_pointer_v<SetterFunc>>>
    static const c74::min::atoms& try_call_external_setter(std::unique_ptr<ObjectType>& obj_ptr
                                                           , SetterFunc setter_func
                                                           , const c74::min::atoms& new_value
                                                           , const c74::min::atoms& current_value
                                                           , c74::min::logger& cerr) noexcept {
        if (!obj_ptr) {
            // object not yet constructed: set max attribute to new value without updating object
            return new_value;
        }

        try {
            (obj_ptr.get()->*setter_func)(new_value);
            return new_value;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return current_value;
        }
    }
};

// ==============================================================================================


class Messages {
public:
    Messages() = delete;

    static c74::min::message<> bang_message(
            c74::min::object_base* obj
            , const c74::min::function& handle_input
            , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET
    ) noexcept {
        return c74::min::message<>{obj, "bang", description, handle_input};
    }


    static c74::min::message<> list_message(
            c74::min::object_base* obj
            , const c74::min::function& handle_input
            , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET
    ) noexcept {
        return c74::min::message<>{obj, "list", description, handle_input};
    }


    static c74::min::message<> number_message(
            c74::min::object_base* obj
            , const c74::min::function& handle_input
            , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET
    ) noexcept {
        return c74::min::message<>{obj, "number", description, handle_input};
    }


    static c74::min::message<> list_of_list_message(
            c74::min::object_base* obj
            , const c74::min::function& handle_input
            , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET_LOL
    ) noexcept {
        return c74::min::message<>{obj, "[", description, c74::min::setter{
                [&handle_input](const c74::min::atoms& args, const int inlet) {
                    auto formatted = AtomParser::prepend_leading_bracket(args);
                    handle_input(formatted, inlet);
                    return c74::min::atoms();
                }}};
    };


    // needed for messages beginning with 'null'
    static c74::min::message<> anything_message(
            c74::min::object_base* obj
            , const c74::min::function& handle_input
            , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET
    ) noexcept {
        return c74::min::message<>{obj, "anything", description, handle_input};
    }

};


// ==============================================================================================

class TriggerStereotypes {
public:
    TriggerStereotypes() = delete;

    static void output_as_triggers_sorted(const Voices<Trigger>& triggers
                                          , c74::min::outlet<>& outlet
                                          , c74::min::logger& cerr) {
        return output_as_triggers_sorted(triggers, outlet, outlet, cerr);
    }

    static void output_as_triggers_sorted(const Voices<Trigger>& triggers
                                          , c74::min::outlet<>& pulse_on_outlet
                                          , c74::min::outlet<>& pulse_off_outlets
                                          , c74::min::logger& cerr) {
        if (triggers.is_empty_like()) {
            return;
        }

        auto [pulse_ons, pulse_offs] = triggers.partition([](const auto& trigger) {
            return trigger.is(Trigger::Type::pulse_on);
        });

        if (!pulse_offs.is_empty_like()) {
            if (auto parsed = AtomFormatter::triggers2atoms(pulse_offs)) {
                pulse_off_outlets.send(*parsed);
            } else {
                cerr << parsed.err().message() << c74::min::endl;
            }
        }

        if (!pulse_ons.is_empty_like()) {
            if (auto parsed = AtomFormatter::triggers2atoms(pulse_ons)) {
                pulse_on_outlet.send(*parsed);
            } else {
                cerr << parsed.err().message() << c74::min::endl;
            }
        }
    }

};


// ==============================================================================================

class EventStereotypes {
public:
    EventStereotypes() = delete;

    static void output_as_events(const Voices<Event>& events
                                 , c74::min::outlet<>& outlet
                                 , std::optional<c74::min::outlet<>> done_outlet
                                 , c74::min::logger& cerr) {
        if (events.is_empty_like()) {
            return;
        }

        for (const auto& event: events) {
            if (auto parsed_events = AtomFormatter::events2atoms(event)) {
                for (const auto& parsed: *parsed_events) {
                    outlet.send(parsed);
                }
            } else {
                cerr << parsed_events.err().message() << c74::min::endl;
            }
        }

        if (done_outlet) {
            done_outlet->send(Keywords::BANG);
        }
    }
};


// ==============================================================================================

class TypeSpecificationStereotypes {
public:
    TypeSpecificationStereotypes() = delete;

    static Result<c74::min::message_type> atoms2type_specification(const c74::min::atoms& args) {
        if (args.empty()) {
            return Error(ErrorMessages::TYPE_SPEC_MISSING);
        } else {
            return atom2type_specification(args[0]);
        }
    }

    static Result<c74::min::message_type> atom2type_specification(const c74::min::atom& args) {
        if (auto parsed = AtomParser::atom2value<std::string>(args)) {
            return string2type_specification(*parsed);
        } else {
            return Error(ErrorMessages::TYPE_SPEC_WRONG_TYPE);
        }
    }

    static Result<c74::min::message_type> string2type_specification(const std::string& str) {
        if (str == "i" || str == "int") {
            return c74::min::message_type::int_argument;
        } else if (str == "f" || str == "float") {
            return c74::min::message_type::float_argument;
        } else if (str == "s" || str == "symbol") {
            return c74::min::message_type::symbol_argument;
        } else {
            return Error(ErrorMessages::TYPE_SPEC_INVALID);
        }
    }


};


#endif //SERIALIST_MAX_MAX_STEREOTYPES_H
