
#ifndef SERIALIST_MAX_ATTRIBUTE_SETTERS_H
#define SERIALIST_MAX_ATTRIBUTE_SETTERS_H

#include "c74_min_api.h"
#include "result.h"
#include "parsing.h"
#include "core/generatives/sequence.h"
#include "core/generatives/variable.h"

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

#endif //SERIALIST_MAX_ATTRIBUTE_SETTERS_H
