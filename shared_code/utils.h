
#ifndef SERIALIST_MAX_UTILS_H
#define SERIALIST_MAX_UTILS_H

#include <type_traits>
#include "core/utility/traits.h"
#include "c74_min_api.h"
#include "core/collections/voices.h"

namespace maxutils {

//template<typename T>

template<typename T, typename = std::enable_if_t<utils::is_printable_v<T>>>
void print(const T& obj, c74::min::logger& logger, bool endl = true) {
    logger << obj;
    if (endl)
        logger << c74::min::endl;
}

//void print(const Trigger& trigger, c74::min::logger& logger, bool endl = true) {
//    logger << static_cast<std::string>(trigger);
//    if (endl)
//        logger << c74::min::endl;
//}

template<typename T, typename = std::enable_if_t<utils::is_printable_v<T>>>
void print(const Voice<T>& obj, c74::min::logger& logger) {
    logger << "[";
    for (const T& element: obj.vector()) {
        print(element, logger, false);
        logger << ", ";
    }
    logger << "]" << c74::min::endl;
}

template<typename T, typename = std::enable_if_t<utils::is_printable_v<T>>>
void print(const Voices<T>& obj, c74::min::logger& logger) {
    logger << "{ ";
    for (const auto& voice: obj.vec())
        print(voice, logger);

    logger << " }" << c74::min::endl;
}


} // namespace maxutils

#endif //SERIALIST_MAX_UTILS_H
