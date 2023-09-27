
#ifndef SERIALIST_MAX_UTILS_H
#define SERIALIST_MAX_UTILS_H

#include "c74_min_api.h"
#include "result.h"

namespace parsing {


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

template<typename OutputType, typename VoiceType = Facet>
Result<c74::min::atoms> voices2atoms(Voices<VoiceType> voices) {
    c74::min::atoms atms;
    for (auto& voice: voices.vector()) {
        // TODO: Another solution would be to just use Voices::fronts
        if (voice.size() != 1) {
            return {Error("Voices with multiple elements not supported yet")};
        }
        atms.emplace_back(static_cast<OutputType>(voice.at(0)));
    }
    return {atms};
}

// ==============================================================================================

template<typename T>
struct is_atom_convertible
        : std::disjunction<
                std::is_arithmetic<T>
                , std::is_same<T, std::string>
                , std::is_same<T, bool>
                , std::is_enum<T>
        > {
};


template<typename T, typename = std::enable_if_t<std::is_arithmetic_v<T>>>
Result<T> parse_single(const c74::min::atoms& atms
                       , std::optional<T> low_range = std::nullopt
                       , std::optional<T> high_range = std::nullopt) {
    if (atms.size() != 1) {
        return Error("Wrong number of arguments for " + std::string(typeid(T).name()));
    }


    auto atm = atms.at(0);
    if (atm.type() == c74::min::message_type::float_argument || atm.type() == c74::min::message_type::int_argument) {
        auto v_unbounded = static_cast<T>(atm);
        if ((low_range.has_value() && v_unbounded < *low_range)
            || (high_range.has_value() && v_unbounded > *high_range)) {
            return Error("Argument out of range");
        }

        return v_unbounded;

    } else {
        return Error("Could not convert atom to type " + std::string(typeid(T).name()));
    }

}


template<typename T, typename = std::enable_if_t<is_atom_convertible<T>::value>>
Result<T> from_atom(const c74::min::atom& atm) {
    if constexpr (std::is_same_v<T, bool>) {
        if (atm.type() == c74::min::message_type::int_argument) {
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
Result<std::vector<T>> from_atoms(const c74::min::atoms& atms) {
    std::vector<T> result;
    for (auto& atm: atms) {
        if (auto val = from_atom<T>(atm)) {
            result.push_back(val.ok());
        } else {
            return Error("Could not convert atom to type " + std::string(typeid(T).name()));
        }
    }
    return result;
}

} // namespace: parsing


#endif //SERIALIST_MAX_UTILS_H
