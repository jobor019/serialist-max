
#ifndef SERIALIST_PARSING_H
#define SERIALIST_PARSING_H

#include "c74_min_api.h"
#include "result.h"
#include "magic_enum.hpp"
#include "core/collections/vec.h"
#include "core/collections/voices.h"
#include "core/types/facet.h"
#include "core/types/trigger.h"
#include "core/types/event.h"

using namespace serialist;

namespace parsing {

const inline std::string NULL_STRING = "null";

inline bool is_null(const c74::min::atom& atm) noexcept {
    return (atm.type() == c74::min::message_type::symbol_argument
            && static_cast<std::string>(atm) == NULL_STRING);
}

inline bool is_null(const c74::min::atoms& atms) noexcept {
    return atms.size() == 1 && is_null(atms.front());
}

inline bool is_bang(const c74::min::atom& atm) noexcept {
    return (atm.type() == c74::min::message_type::symbol_argument
            && static_cast<std::string>(atm) == "bang");
}

inline bool is_bang(const c74::min::atoms& atms) noexcept {
    return atms.size() == 1 && is_bang(atms.front());
}

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

template<typename T>
inline constexpr bool is_atom_convertible_v = is_atom_convertible<T>::value;


// ==============================================================================================

bool is_empty_like(const c74::min::atom& atm) noexcept {
    return (atm.type() == c74::min::message_type::no_argument
            || atm.type() == c74::min::message_type::symbol_argument && static_cast<std::string>(atm).empty())
           || (atm.type() == c74::min::message_type::int_argument && static_cast<int>(atm) == 0)
           || (atm.type() == c74::min::message_type::float_argument && std::abs(static_cast<float>(atm)) < 1e-6);
}


bool is_empty_like(const c74::min::atoms& atms) noexcept {
    if (atms.empty()) {
        return true;
    } else if (atms.size() == 1) {
        return is_empty_like(atms.at(0));
    }
    return false;
}

std::size_t to_zero_index(std::size_t i) noexcept {
    return utils::decrement(i);
}

std::size_t to_one_index(std::size_t i) noexcept {
    return utils::increment(i);
}

} // namespace parsing



// ==============================================================================================


class AtomFormatter {
public:

    AtomFormatter() = delete;


    template<typename OutputType
             , typename InputType = OutputType
             , typename = std::enable_if_t<parsing::is_atom_convertible<OutputType>::value>>
    static c74::min::atom value2atom(const InputType& value
                                     , std::optional<std::function<OutputType(InputType)>> f = std::nullopt) {
        if (f)
            return (*f)(value);

        return {static_cast<OutputType>(value)};
    }


    template<typename OutputType
             , typename InputType = OutputType
             , typename = std::enable_if_t<parsing::is_atom_convertible<OutputType>::value>>
    static c74::min::atoms vec2atoms(const Vec<InputType>& v
                                     , std::optional<std::function<OutputType(InputType)>> f = std::nullopt) {
        c74::min::atoms atms;
        atms.reserve(v.size());

        for (auto& elem: v) {
            atms.emplace_back(value2atom(elem, f));
        }
        return atms;
    }


    template<typename OutputType
             , typename InputType = OutputType
             , typename = std::enable_if_t<parsing::is_atom_convertible<OutputType>::value>>
    static c74::min::atoms voices2atoms(const Voices<InputType>& voices
                                        , std::optional<std::function<OutputType(InputType)>> f = std::nullopt
                                        , bool force_list_of_list_format = false) {
        if (force_list_of_list_format || std::any_of(voices.begin(), voices.end()
                                                    , [](const Voice<InputType>& v) { return v.size() > 1; })) {
            return format_list_of_lists(voices, f);
        } else {
            return format_simple_list(voices, f);
        }
    }


    static Result<c74::min::atom> trigger2atom(const Trigger& trigger) {
        if (trigger.is(Trigger::Type::pulse_on)) {
            // Pulse on: positive number (one-indexed)
            return {static_cast<long>(parsing::to_one_index(trigger.get_id()))};
        } else if (trigger.is(Trigger::Type::pulse_off)) {
            // Pulse off: negative number (one-indexed)
            return {-static_cast<long>(parsing::to_one_index(trigger.get_id()))};
        } else {
            return Error("Invalid trigger type");
        }
    }

    static Result<c74::min::atom> trigger2atom(const std::optional<Trigger>& trigger) {
        if (trigger) {
            return trigger2atom(*trigger);
        }
        return {parsing::NULL_STRING};
    }


    /** Assumes transposed triggers, i.e. iterative output from Voices<Trigger>.transpose() */
    static Result<c74::min::atoms> triggers2atoms(const Voice<std::optional<Trigger>>& triggers) {
        Vec<c74::min::atom> result = Vec<c74::min::atom>::allocated(triggers.size());
        for (const auto& trigger: triggers) {
            auto atm = trigger2atom(trigger);
            if (atm.is_ok()) {
                result.append(*atm);
            } else {
                return atm.err();
            }
        }
        return result.vector();
    }


    static Result<c74::min::atoms> event2atoms(const Event& event) {
        if (event.is<MidiNoteEvent>()) {
            auto atms = Vec<c74::min::atom>::allocated(3);

            const auto& e = event.as<MidiNoteEvent>();
            atms.append(static_cast<long>(e.note_number));
            atms.append(static_cast<long>(e.velocity));
            atms.append(static_cast<long>(e.channel));

            return atms.vector();
        } else {
            return Error("Unknown event type");
        }
    }

    static Result<Vec<c74::min::atoms>> events2atoms(const Vec<Event>& events) {
        Vec<c74::min::atoms> result = Vec<c74::min::atoms>::allocated(events.size());
        for (const auto& event: events) {
            if (auto atms = event2atoms(event)) {
                result.append(*atms);
            } else {
                return atms.err();
            }
        }
        return result;
    }

    // Note: There's no Voices<Event> to atom, as this would return a list of lists of atoms. For outputting,
    //       use events2atoms on each element in the Voices<Event> or EventStereotypes::output_as_events


private:

    template<typename OutputType
             , typename InputType = OutputType
             , typename = std::enable_if_t<parsing::is_atom_convertible<OutputType>::value>>
    static c74::min::atoms format_simple_list(const Voices<InputType>& voices
                                              , std::optional<std::function<OutputType(InputType)>> f = std::nullopt) {
        c74::min::atoms atms;
        atms.reserve(voices.size());

        for (std::size_t i = 0; i < voices.size(); ++i) {
            if (voices[i].empty()) {
                atms.emplace_back(parsing::NULL_STRING);
            } else {
                assert(voices[i].size() <= 1);
                atms.emplace_back(value2atom(voices[i][0], f));
            }
        }
        return atms;
    }


    template<typename OutputType
             , typename InputType = OutputType
             , typename = std::enable_if_t<parsing::is_atom_convertible<OutputType>::value>>
    static c74::min::atoms format_list_of_lists(const Voices<InputType>& voices
                                                , std::optional<
            std::function<OutputType(InputType)>> f = std::nullopt) {
        c74::min::atoms atms;
        atms.emplace_back("[");
        for (const auto& voice: voices) {
            format_inner(voice, atms, f);
        }
        atms.emplace_back("]");
        return atms;
    }


    template<typename OutputType
             , typename InputType = OutputType
             , typename = std::enable_if_t<parsing::is_atom_convertible<OutputType>::value>>
    static void format_inner(const Voice<InputType>& voice
                             , c74::min::atoms& output
                             , std::optional<std::function<OutputType(InputType)>> f = std::nullopt) {
        output.emplace_back("[");
        for (const auto& v: voice) {
            output.emplace_back(value2atom(v, f));
        }
        output.emplace_back("]");
    }
};


// ==============================================================================================

class AtomParser {
public:
    using AtomIterator = c74::min::atoms::const_iterator;

    AtomParser() = delete;


    template<typename T, typename = std::enable_if_t<parsing::is_atom_convertible_v<T>>>
    static Result<T> atom2value(const c74::min::atom& atm) noexcept {
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
        return Error("Invalid type for atom (" + static_cast<std::string>(atm) + ")");
    }


    template<typename T, typename = std::enable_if_t<parsing::is_atom_convertible_v<T>>>
    static Result<T> atoms2value(const c74::min::atoms& atms) noexcept {
        auto [begin, end, size] = get_content_edges(atms);
        (void) size;

        if (begin == end) {
            return Error("Missing value");
        }

        return atom2value<T>(*begin);
    }


    template<typename T, typename = std::enable_if_t<parsing::is_atom_convertible_v<T>>>
    static Result<Vec<T>> atoms2vec(const c74::min::atoms& atms) noexcept {
        if (parsing::is_null(atms)) {
            return Vec<T>();
        }

        auto [begin, end, size] = get_content_edges(atms);

        Vec<T> result = Vec<T>::allocated(size);

        for (auto it = begin; it != end; ++it) {
            if (auto val = atom2value<T>(*it)) {
                result.append(val.ok());
            } else {
                return Error("Invalid type for atom (" + static_cast<std::string>(*it) + ")");
            }
        }

        return result;
    }


    static Result<std::optional<Trigger>> atom2trigger(const c74::min::atom& atm) noexcept {
        if (atm.type() == c74::min::message_type::int_argument) {
            auto trigger_type_id = static_cast<long>(atm);

            if (trigger_type_id == 0) {
                return Error("Invalid trigger: 0 is neither a pulse on nor a pulse off");
            }

            if (trigger_type_id < 0) {
                return {Trigger::with_manual_id(Trigger::Type::pulse_off, parsing::to_zero_index(-trigger_type_id))};

            } else {
                return {Trigger::with_manual_id(Trigger::Type::pulse_on, parsing::to_zero_index(trigger_type_id))};
            }

        } else if (parsing::is_null(atm)) { // "null" is a valid trigger without a value
            return {std::nullopt};

        } else {
            return Error("Invalid trigger type: triggers should only be non-zero integral values or 'null'");
        }
    }

    // TODO: The approach for parsing and formatting triggers seems completely redundant, we should just implement
    //       atoms2triggers as a call to atoms2voices, and then implement triggers2atoms(Voices<Trigger>) instead of
    //       Voice<Trigger> (to get rid of the redundant transform approach)

    static Result<Voices<Trigger>> atoms2triggers(const c74::min::atoms& atms
                                                  , bool empty_creates_new = false) noexcept {
        // if atms.empty(), this is typically the result of processing a singular "bang".
        // note that null or [] will not create any trigger here
        if (empty_creates_new && atms.empty()) {
            return Voices<Trigger>::singular(Trigger::pulse_on());
        }

        auto [begin, end, size] = get_content_edges(atms);

        Voices<Trigger> result = Voices<Trigger>::zeros(size);

        auto it = begin;
        for (std::size_t i = 0; i < size; ++i) {
            if (auto trigger = atom2trigger(*it); trigger.is_ok()) {
                if (trigger.ok().has_value()) {
                    result[i] = Vec<Trigger>::singular(*trigger.ok()); // valid trigger
                } // else: null trigger, continue
            } else {
                return trigger.err();
            }
            ++it;
        }
        return result;
    }


    template<typename T, typename = std::enable_if_t<parsing::is_atom_convertible_v<T>>>
    static Result<Voices<T>> atoms2voices(const c74::min::atoms& atms, bool leading_bracket_stripped = false) noexcept {
        auto [start, end, size] = get_content_edges(atms, leading_bracket_stripped);
        (void) size;

        Vec<Voice<T>> output = {};

        auto it = start;
        while (it != end) {
            if (*it == "[") {
                ++it;
                if (auto inner = parse_inner<T>(it, end)) {
                    output.append(std::move(*inner));
                } else {
                    return inner.err();
                }

            } else if (*it == "]") {
                return Error("Ill-formatted list: ']' before end");
            } else if (parsing::is_null(*it)) {
                output.append(Voice<T>());
                ++it;
            } else {
                output.append(Voice<T>{*it});
                ++it;
            }
        }

        if (output.empty()) {
            return Voices<T>::empty_like();
        }
        return Voices<T>(output);
    }


    static c74::min::atoms prepend_leading_bracket(const c74::min::atoms& atms) noexcept {
        c74::min::atoms output;
        output.reserve(atms.size() + 1);

        output.emplace_back("[");
        output.insert(output.end(), atms.begin(), atms.end());
        return output;
    }


    static bool is_list_of_lists(const c74::min::atoms& atms, bool leading_bracket_stripped = false) noexcept {
        if (leading_bracket_stripped) {
            return (!atms.empty() && atms.back() == "]");
        } else {
            return (atms.size() >= 2 && atms.front() == "[" && atms.back() == "]");
        }
    }


private:
    static std::tuple<AtomIterator, AtomIterator, std::size_t>
    get_content_edges(const c74::min::atoms& atms, bool leading_bracket_stripped = false) noexcept {
        if (is_list_of_lists(atms, leading_bracket_stripped)) {
            return {atms.begin() + 1 - static_cast<long>(leading_bracket_stripped), atms.end() - 1, atms.size() - 2};
        } else {
            return {atms.begin(), atms.end(), atms.size()};
        }
    }


    template<typename T, typename = std::enable_if_t<parsing::is_atom_convertible_v<T>>>
    static Result<Voice<T>> parse_inner(AtomIterator& it, AtomIterator& end) noexcept {
        Voice<T> output;
        while (it != end) {
            if (*it == "[" || parsing::is_null(*it)) {
                return Error("Cannot parse nested lists");
            } else if (*it == "]") {
                ++it;
                return {output};
            } else {
                output.append(*it);
                ++it;
            }
        }
        return Error("Reached end while parsing inner list");
    }

};


#endif //SERIALIST_PARSING_H
