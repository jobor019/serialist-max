
#ifndef SERIALIST_MAX_UTILS_H
#define SERIALIST_MAX_UTILS_H

#include "c74_min_api.h"
#include "result.h"

namespace parsing {


bool is_empty_like(const c74::min::atom& atm) {
    return (atm.type() == c74::min::message_type::symbol_argument && static_cast<std::string>(atm).empty())
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


}

#endif //SERIALIST_MAX_UTILS_H
