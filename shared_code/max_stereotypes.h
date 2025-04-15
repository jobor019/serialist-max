#ifndef SERIALIST_MAX_MAX_STEREOTYPES_H
#define SERIALIST_MAX_MAX_STEREOTYPES_H

#include "c74_min_api.h"
#include "result.h"
#include "parsing.h"
#include "core/generatives/sequence.h"
#include "core/generatives/variable.h"
#include "core/types/event.h"

class AttributeNames {
public:
    AttributeNames() = delete;

    static inline const std::string ENABLED = "enabled";
    static inline const std::string NUM_VOICES = "voices";
    static inline const std::string TRIGGERS = "triggers";

    static inline const std::string CLOCK = "clock";
    static inline const std::string FLUSH = "flush";
    static inline const std::string BANG = "bang";

    static inline const std::string TYPE_SPEC = "type";

    static inline const std::string AUTO_RESTORE = "autorestore";

};


class Titles {
public:
    Titles() = delete;

    static inline const c74::min::title ENABLED = "Enabled";
    static inline const c74::min::title NUM_VOICES = "Number of Voices";
    static inline const c74::min::title TRIGGERS = "Triggers";

    static inline const c74::min::title CLOCK = "Clock Source";
    static inline const c74::min::title FLUSH = "Flush";

    static inline const c74::min::title TYPE_SPEC = "Type Specification";

    static inline const c74::min::title AUTO_RESTORE = "Autorestore";
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

    static inline const c74::min::description AUTO_RESTORE = "When enabled, the object will automatically store its state each"
                                                   " time the patcher is saved, and restore it the next time the"
                                                   " patcher is loaded.\n\nNote that any attributes explicitly"
                                                   " provided in the object's box will override the stored state.";
};


// ==============================================================================================

class Categories {
public:
    Categories() = delete;

    static inline const c74::min::category STATE = "State";
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
    static void set_value(const c74::min::atoms& args
                          , Variable<OutputType
                                     , StoredType>& variable
                          , std::mutex* mutex = nullptr) {
        auto v = AtomParser::atoms2value<ParseType>(args).ok();

        std::unique_lock<std::mutex> lock;
        if (mutex) {
            // ReSharper disable once CppDFAUnusedValue
            lock = std::unique_lock(*mutex);
        }

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
    static void set_value(const c74::min::atoms& args
        , Sequence<OutputType
        , StoredType>& seq
        , std::mutex* mutex = nullptr) {
        auto v = AtomParser::atoms2value<ParseType>(args).ok();

        std::unique_lock<std::mutex> lock;
        if (mutex) {
            // ReSharper disable once CppDFAUnusedValue
            lock = std::unique_lock(*mutex);
        }

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
    static void set_vector(const c74::min::atoms& args
        , Sequence<OutputType, StoredType>& seq
        , std::mutex* mutex = nullptr) {
        auto vec = AtomParser::atoms2vec<ParseType>(args).ok();

        std::unique_lock<std::mutex> lock;
        if (mutex) {
            // ReSharper disable once CppDFAUnusedValue
            lock = std::unique_lock(*mutex);
        }

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
                           , const std::function<StoredType(const ParseType&)>& converter
                           , std::mutex* mutex = nullptr) {
        auto vec = AtomParser::atoms2vec<ParseType>(args).ok();
        auto voices = Voices<StoredType>::transposed(vec.template as_type<StoredType>(converter));

        std::unique_lock<std::mutex> lock;
        if (mutex) {
            // ReSharper disable once CppDFAUnusedValue
            lock = std::unique_lock(*mutex);
        }

        seq.set_values(voices);
    }


    /**
     * @throws ResultError if parsing fails
     */
    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static void set_vector_singular(const c74::min::atoms& args
        , Sequence<OutputType
        , StoredType>& seq
        , std::mutex* mutex = nullptr) {
        auto vec = AtomParser::atoms2vec<ParseType>(args).ok();

        std::unique_lock<std::mutex> lock;
        if (mutex) {
            // ReSharper disable once CppDFAUnusedValue
            lock = std::unique_lock(*mutex);
        }

        if constexpr (std::is_same_v<ParseType, StoredType>) {
            seq.set_values(Voices<StoredType>::singular(vec));
        } else {
            seq.set_values(Voices<StoredType>::singular(vec.template as_type<StoredType>()));
        }
    }


    /**
     * @throws ResultError if parsing fails
     */
    template<typename StoredType, typename ParseType, typename OutputType>
    static void set_vector_singular(const c74::min::atoms& args
                                    , Sequence<OutputType, StoredType>& seq
                                    , const std::function<StoredType(const ParseType&)>& converter
                                    , std::mutex* mutex = nullptr) {
        auto vec = AtomParser::atoms2vec<ParseType>(args).ok();
        auto voices = Voices<StoredType>::singular(vec.template as_type<StoredType>(converter));

        std::unique_lock<std::mutex> lock;
        if (mutex) {
            // ReSharper disable once CppDFAUnusedValue
            lock = std::unique_lock(*mutex);
        }

        seq.set_values(voices);
    }


    /**
     * @throws ResultError if parsing fails
     */
    template<typename StoredType, typename OutputType>
    static void set_voices(const c74::min::atoms& args
                           , Sequence<OutputType, StoredType>& seq
                           , bool leading_bracket_stripped = false
                           , std::mutex* mutex = nullptr) {
        auto voices = AtomParser::atoms2voices<StoredType>(args, leading_bracket_stripped).ok();

        std::unique_lock<std::mutex> lock;
        if (mutex) {
            // ReSharper disable once CppDFAUnusedValue
            lock = std::unique_lock(*mutex);
        }

        seq.set_values(voices);
    }


    // ==============================================================================================

    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static bool try_set_value(const c74::min::atoms& args
                              , Variable<OutputType, StoredType>& variable
                              , c74::min::logger& cerr
                              , std::mutex* mutex = nullptr) noexcept {
        try {
            set_value(args, variable, mutex);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static bool try_set_value(const c74::min::atoms& args
                              , Sequence<OutputType, StoredType>& seq
                              , c74::min::logger& cerr
                              , std::mutex* mutex = nullptr) noexcept {
        try {
            set_value(args, seq, mutex);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static bool try_set_vector(const c74::min::atoms& args
                               , Sequence<OutputType, StoredType>& seq
                               , c74::min::logger& cerr
                               , std::mutex* mutex = nullptr) noexcept {
        try {
            set_vector(args, seq, mutex);
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
                               , const std::function<StoredType(const ParseType&)>& converter
                               , std::mutex* mutex = nullptr) noexcept {
        try {
            set_vector(args, seq, converter, mutex);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static bool try_set_vector_singular(const c74::min::atoms& args
                                        , Sequence<OutputType, StoredType>& seq
                                        , c74::min::logger& cerr
                                        , std::mutex* mutex = nullptr) noexcept {
        try {
            set_vector_singular(args, seq, mutex);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename ParseType, typename OutputType>
    static bool try_set_vector_singular(const c74::min::atoms& args
                                        , Sequence<OutputType, StoredType>& seq
                                        , c74::min::logger& cerr
                                        , const std::function<StoredType(const ParseType&)>& converter
                                        , std::mutex* mutex = nullptr) noexcept {
        try {
            set_vector_singular(args, seq, converter, mutex);
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
                               , bool leading_bracket_stripped = false
                               , std::mutex* mutex = nullptr) noexcept {
        try {
            set_voices(args, seq, leading_bracket_stripped, mutex);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    // Helper: Convert from title format to name format. Example: "Num Voices" => "numvoices"
    static std::string title_to_name(const std::string& title) {
        std::string result;

        for (char c : title) {
            if (c != ' ') {
                result += static_cast<char>(std::tolower(c));
            }
        }

        return result;
    }

    static c74::min::title name_to_title(const std::string& s) {
        if (s.empty()) {
            return "";
        }

        std::string result = s;
        result[0] = static_cast<char>(std::toupper(result[0]));
        return to_title(result);
    }

    // Poor implementation of c74::min::title does not support passing std::string to its ctor.
    // Explicitly calling c_str is required, which confuses most linters
    static c74::min::title to_title(const std::string& s) {
        return s.c_str();  // NOLINT(*-redundant-string-cstr)
    }

};


// ==============================================================================================

class TriggerStereotypes {
public:
    TriggerStereotypes() = delete;


    static void output_as_triggers_sorted(const Voices<Trigger>& triggers
                                          , c74::min::outlet<>& outlet
                                          , c74::min::logger& cerr) {
        if (triggers.is_empty_like()) {
            return;
        }

        auto transposed = triggers.transpose();

        for (const auto& t : transposed) {
            if (auto parsed = AtomFormatter::triggers2atoms(t)) {
                outlet.send(*parsed);
            } else {
                cerr << parsed.err().message() << c74::min::endl;
            }
        }
    }


    // static void output_as_triggers_sorted(const Voices<Trigger>& triggers
    //                                       , c74::min::outlet<>& pulse_on_outlet
    //                                       , c74::min::outlet<>& pulse_off_outlets
    //                                       , c74::min::logger& cerr) {
    //     if (triggers.is_empty_like()) {
    //         return;
    //     }
    //
    //     auto [pulse_ons, pulse_offs] = triggers.partition([](const auto& trigger) {
    //         return trigger.is(Trigger::Type::pulse_on);
    //     });
    //
    //     if (!pulse_offs.is_empty_like()) {
    //         if (auto parsed = AtomFormatter::triggers2atoms(pulse_offs)) {
    //             pulse_off_outlets.send(*parsed);
    //         } else {
    //             cerr << parsed.err().message() << c74::min::endl;
    //         }
    //     }
    //
    //     if (!pulse_ons.is_empty_like()) {
    //         if (auto parsed = AtomFormatter::triggers2atoms(pulse_ons)) {
    //             pulse_on_outlet.send(*parsed);
    //         } else {
    //             cerr << parsed.err().message() << c74::min::endl;
    //         }
    //     }
    // }

private:
    // /** returns a Vec of the same size as the voice with the maximum number of triggers,
    //  *     with each contained Voice having the same size as the input Voices
    //  */
    // Vec<Voice<std::optional<Trigger>>> transpose(const Voices<Trigger>& triggers) {
    //
    //
    //     std::size_t max_length = 0;
    //     for (const auto& voice: triggers) {
    //         if (voice.size() > max_length) {
    //             max_length = voice.size();
    //         }
    //     }
    //
    //     auto transposed = Vec<Voice<std::optional<Trigger>>>::allocated(max_length);
    // }

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

        for (const auto& event : events) {
            if (auto parsed_events = AtomFormatter::events2atoms(event)) {
                for (const auto& parsed : *parsed_events) {
                    outlet.send(parsed);
                }
            } else {
                cerr << parsed_events.err().message() << c74::min::endl;
            }
        }

        if (done_outlet) {
            done_outlet->send(AttributeNames::BANG);
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


// ==============================================================================================

//class DomainTypeStereotypes {
//public:
//    static constexpr std::size_t DOMAIN_TYPES = magic_enum::enum_count<DomainType>();
//    static constexpr std::size_t FREE_DOMAIN_TYPE  = -1;
//
//    DomainTypeStereotypes() = delete;
//
//    static Result<std::optional<DomainType>> atoms2domain_type(const c74::min::atoms& args, bool include_free_type) {
//        if (auto v = AtomParser::atoms2value<std::size_t>(args) ){
//            if (*v >= DOMAIN_TYPES || *v < 0) {
//                if (include_free_type) {
//                    return {std::nullopt};
//                } else {
//                    return Error("invalid domain type");
//                }
//            } else {
//                return {static_cast<DomainType>(*v)};
//            }
//        }
//        return Error("bad type for domain type");
//    }
//};


#endif //SERIALIST_MAX_MAX_STEREOTYPES_H
