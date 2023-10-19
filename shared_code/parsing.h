
#ifndef SERIALIST_MAX_UTILS_H
#define SERIALIST_MAX_UTILS_H

#include "c74_min_api.h"
#include "result.h"
#include "magic_enum.hpp"
#include "core/collections/vec.h"
#include "core/collections/voices.h"
#include "core/algo/facet.h"

namespace parsing {

const inline std::string NULL_STRING = "null";

template<typename T>
struct is_atom_convertible
        : std::disjunction<
                std::is_arithmetic<T>
                , std::is_same<T, std::string>
                , std::is_same<T, bool>
                , std::is_enum<T>
                , std::is_same<T, c74::min::atom>
        > {
};


// ==============================================================================================

bool is_empty_like(const c74::min::atom& atm) {
    return (atm.type() == c74::min::message_type::no_argument
            || atm.type() == c74::min::message_type::symbol_argument && static_cast<std::string>(atm).empty())
           || (atm.type() == c74::min::message_type::int_argument && static_cast<int>(atm) == 0)
           || (atm.type() == c74::min::message_type::float_argument && std::abs(static_cast<float>(atm)) < 1e-6);
}


bool is_empty_like(const c74::min::atoms& atms) {
    if (atms.empty()) {
        return true;
    } else if (atms.size() == 1) {
        return is_empty_like(atms.at(0));
    }
    return false;
}


// ==============================================================================================


template<typename OutputType, typename InputType, typename = std::enable_if_t<is_atom_convertible<OutputType>::value>>
c74::min::atom value2atom(const InputType& value
                          , std::optional<std::function<OutputType(InputType)>> f = std::nullopt) {
    if (f)
        return (*f)(value);

    return {static_cast<OutputType>(value)};
}


template<typename OutputType, typename InputType = Facet
         , typename = std::enable_if_t<is_atom_convertible<OutputType>::value>>
c74::min::atoms vec2atoms(const Vec<InputType>& v
                          , std::optional<std::function<OutputType(InputType)>> f = std::nullopt) {
    c74::min::atoms atms;
    atms.reserve(v.size());

    for (auto& elem: v) {
        atms.emplace_back(value2atom(elem, f));
    }
    return atms;
}


template<typename OutputType, typename InputType = Facet
         , typename = std::enable_if_t<is_atom_convertible<OutputType>::value>>
Result<c74::min::atoms> voices2atoms(const Voices<InputType>& voices
                                     , std::optional<std::function<OutputType(InputType)>> f = std::nullopt) {
    c74::min::atoms atms;
    atms.reserve(voices.size());

    for (std::size_t i = 0; i < voices.size(); ++i) {
        if (voices[i].empty()) {
            atms.emplace_back(NULL_STRING);
        } else if (voices[i].size() == 1) {
            atms.emplace_back(value2atom(voices[i][0], f));
        } else {
            return Error("Invalid voice: cannot parse voices with multiple elements in a single voice");
        }
    }
    return atms;
}


Result<c74::min::atom> trigger2atom(const Vec<Trigger>& trigger) {
    if (trigger.empty()) {
        return {NULL_STRING};
    } else if (trigger.size() == 1) {
        return {static_cast<int>(trigger[0])};
    }
    return Error("Invalid trigger: cannot parse multiple triggers in a single voice");
}


Result<c74::min::atoms> triggers2atoms(const Voices<Trigger>& triggers) {
    Vec<c74::min::atom> result = Vec<c74::min::atom>::allocated(triggers.size());
    for (std::size_t i = 0; i < triggers.size(); ++i) {
        auto atm = trigger2atom(triggers[i]);
        if (atm.is_ok()) {
            result[i] = *atm;
        } else {
            return atm.err();
        }
    }
    return result.vector();
}

// ==============================================================================================




//template<typename T, typename = std::enable_if_t<std::is_arithmetic_v<T>>>
//Result<T> parse_single(const c74::min::atoms& atms
//                       , std::optional<T> low_range = std::nullopt
//                       , std::optional<T> high_range = std::nullopt) {
//    if (atms.size() != 1) {
//        return Error("Wrong number of arguments for " + std::string(typeid(T).name()));
//    }
//
//
//    auto atm = atms.at(0);
//    if (atm.type() == c74::min::message_type::float_argument || atm.type() == c74::min::message_type::int_argument) {
//        auto v_unbounded = static_cast<T>(atm);
//        if ((low_range.has_value() && v_unbounded < *low_range)
//            || (high_range.has_value() && v_unbounded > *high_range)) {
//            return Error("Argument out of range");
//        }
//
//        return v_unbounded;
//
//    } else {
//        return Error("Could not convert atom to type " + std::string(typeid(T).name()));
//    }
//}


template<typename T, typename = std::enable_if_t<is_atom_convertible<T>::value>>
Result<T> atom2value(const c74::min::atom& atm) {
    if constexpr (std::is_same_v<T, bool>) {
        if (atm.type() == c74::min::message_type::int_argument
            || atm.type() == c74::min::message_type::float_argument) {
            return {static_cast<int>(atm) > 0};
        }
    } else if constexpr (std::is_arithmetic_v<T>) {
        if (atm.type() == c74::min::message_type::float_argument
            || atm.type() == c74::min::message_type::int_argument) {
            return {static_cast<T>(atm)};
        }
    } else if constexpr (std::is_same_v<T, std::string>) {
        if (atm.type() == c74::min::message_type::symbol_argument) {
            return {static_cast<std::string>(atm)};
        }
    } else if constexpr (std::is_enum_v<T>) {
        if (atm.type() == c74::min::message_type::int_argument
            && static_cast<int>(atm) < magic_enum::enum_count<T>()) {
            return {static_cast<T>(atm)};
        }
    }
    return Error("Could not convert atom to type " + std::string(typeid(T).name()));
}


template<typename T, typename = std::enable_if_t<is_atom_convertible<T>::value>>
Result<T> atoms2value(const c74::min::atoms& atms) {
    if (atms.empty()) {
        return Error("Missing value");
    }
    return atom2value<T>(atms.at(0));
}


template<typename T, typename = std::enable_if_t<is_atom_convertible<T>::value>>
Result<Vec<T>> atoms2vec(const c74::min::atoms& atms) {
    Vec<T> result = Vec<T>::allocated(atms.size());
    for (auto& atm: atms) {
        if (auto val = atom2value<T>(atm)) {
            result.append(val.ok());
        } else {
            return Error("Could not convert atom to type " + std::string(typeid(T).name()));
        }
    }
    return result;
}


Result<std::optional<Trigger>> atom2trigger(const c74::min::atom& atm) {
    if (atm.type() == c74::min::message_type::int_argument) {
        auto trigger_type_index = static_cast<int>(atm);
        auto trigger_type = magic_enum::enum_cast<Trigger>(trigger_type_index);
        if (trigger_type.has_value()) {
            return trigger_type;
        } else {
            return Error("Invalid trigger type: " + std::to_string(trigger_type_index));
        }
    } else if (atm.type() == c74::min::message_type::symbol_argument
               && static_cast<std::string>(atm) == NULL_STRING) {
        return {std::nullopt}; // "null" is a valid trigger without a value
    } else {
        return Error("Invalid trigger type: triggers should only be integer values or 'null'");
    }
}


Result<Voices<Trigger>> atoms2triggers(const c74::min::atoms& atms) {
    Voices<Trigger> result = Voices<Trigger>::zeros(atms.size());
    for (std::size_t i = 0; i < atms.size(); ++i) {
        auto trigger = atom2trigger(atms[i]);
        if (trigger.is_ok()) {
            if (trigger.ok().has_value()) {
                result[i] = Vec<Trigger>::singular(*trigger.ok()); // valid trigger
            } else {
                continue; // null trigger
            }
        } else {
            // invalid trigger: recast error message
            return trigger.err();
        }
    }
    return result;
}


} // namespace: parsing


#endif //SERIALIST_MAX_UTILS_H
