
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

};


class Titles {
public:
    Titles() = delete;

    static inline const c74::min::title ENABLED = "Enabled";
    static inline const c74::min::title NUM_VOICES = "Number of voices";
    static inline const c74::min::title TRIGGERS = "Triggers";
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
};

// ==============================================================================================


class ErrorMessages {
public:
    ErrorMessages() = delete;

    static std::string extra_argument(const std::string& class_name) {
        return "extra argument for message \"ser." + class_name + "\"";
    }

    static std::string missing_argument(const std::string& class_name, const std::string& usage_descriptor = "") {
        auto str = class_name + ": missing argument";

        if (!usage_descriptor.empty()) {
            str += " (usage:  " + class_name + " " + usage_descriptor + ")";
        }

        return str;
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


#endif //SERIALIST_MAX_MAX_STEREOTYPES_H
