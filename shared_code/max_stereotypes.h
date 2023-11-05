
#ifndef SERIALIST_MAX_MAX_STEREOTYPES_H
#define SERIALIST_MAX_MAX_STEREOTYPES_H

#include "c74_min_api.h"
#include "result.h"
#include "parsing.h"
#include "core/generatives/sequence.h"
#include "core/generatives/variable.h"

class Setters {
public:
    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static bool set_vector(const c74::min::atoms& args
                           , Sequence<OutputType, StoredType>& seq
                           , c74::min::logger& cerr) noexcept {
        try {
            auto vec = AtomParser::atoms2vec<ParseType>(args).ok();

            if constexpr (std::is_same_v<ParseType, StoredType>) {
                seq.set_values(Voices<StoredType>::transposed(vec));
            } else {
                seq.set_values(Voices<StoredType>::transposed(vec.template as_type<StoredType>()));
            }
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }

    template<typename StoredType, typename ParseType, typename OutputType>
    static bool set_vector(const c74::min::atoms& args
                           , Sequence<OutputType, StoredType>& seq
                           , c74::min::logger& cerr
                           , const std::function<StoredType(const ParseType&)>& converter) noexcept {
        try {
            auto vec = AtomParser::atoms2vec<ParseType>(args).ok();
            auto voices = Voices<StoredType>::transposed(vec.template as_type<StoredType>(converter));
            seq.set_values(voices);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename OutputType>
    static bool set_voices(const c74::min::atoms& args
                           , Sequence<OutputType, StoredType>& seq
                           , c74::min::logger& cerr
                           , bool leading_bracket_stripped = false) noexcept {
        try {
            auto e = Voices<StoredType>::transposed(AtomParser::atoms2voices<StoredType>(args, leading_bracket_stripped).ok());
            seq.set_values(e);
            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }


    template<typename StoredType, typename ParseType = StoredType, typename OutputType>
    static bool set_value(const c74::min::atoms& args
                          , Variable<OutputType, StoredType>& variable
                          , c74::min::logger& cerr) noexcept {
        try {
            auto v = AtomParser::atoms2value<ParseType>(args).ok();
            if constexpr (std::is_same_v<ParseType, StoredType>) {
                variable.set_value(v);
            } else {
                variable.set_value(static_cast<StoredType>(v));
            }

            return true;
        } catch (ResultError& e) {
            cerr << e.what() << c74::min::endl;
            return false;
        }
    }
};

//class Attribute {
//public:
//    Attribute() = delete;
//
//    static inline c74::min::atoms try_set_internal(const c74::min::atoms& current_value
//                                          , const c74::min::atoms& new_value
//                                          , c74::min::logger& cerr
//                                          , const std::function<void(const c74::min::atoms&)>& setter
//    ) {
//        try {
//            setter(new_value);
//            return new_value;
//        } catch (const ResultError& e) {
//            cerr << e.what() << c74::min::endl;
//            return current_value;
//        }
//    }
//
//};

#endif //SERIALIST_MAX_MAX_STEREOTYPES_H
