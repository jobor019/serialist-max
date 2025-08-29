#ifndef SERIALIST_MAX_MAX_STEREOTYPES_H
#define SERIALIST_MAX_MAX_STEREOTYPES_H

#include "c74_min_api.h"
#include "result.h"
#include "parsing.h"
#include "core/types/event.h"

class AttributeNames {
public:
    AttributeNames() = delete;

    static inline const std::string ENABLED = "enabled";
    static inline const std::string NUM_VOICES = "voices";
    static inline const std::string TRIGGERS = "triggers";

    static inline const std::string USE_INDEX = "index";

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

    static inline const c74::min::title USE_INDEX = "Use Index";

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
    static inline const c74::min::description DEPENDS_ON_INLET_MULTILIST = "(multilist) Function depends on inlet";

    static inline const c74::min::description ENABLED = "(bool) Toggles the object's active state. "
            "When set to 0, the object will not output anything when triggered";

    static inline const c74::min::description NUM_VOICES = "(int) Num Voices: TODO"; // TODO

    static inline const c74::min::description FLUSH = "Flush: TODO";

    static inline const c74::min::description AUTO_RESTORE = "(bool) Save the object's state with the patcher."
            " When enabled, the object will automatically store its state each"
            " time the patcher is saved, and restore it the next time the"
            " patcher is loaded.\n\nNote that any attributes explicitly"
            " provided in the object's box will override the stored state.";

    static inline const c74::min::description INLET_TRIGGERS = "(list) Trigger inputs."
            " Define a list of inputs that will automatically trigger output"
            " (i.e. adding an input to this list will make the inlet hot)."
            " Setting the attribute value to -1 will cause all inlets to be hot";

    static inline const c74::min::description USE_INDEX_WITH_OCTAVES{
        "Treat input values as indices (1) or phase-like values (0)."
        " When the values are phase-like, the inputs will be treated as phase values"
        " in range 0-1 (end exclusive), and the octave will always correspond to integer"
        " values of the input (e.g. 1.0 is first octave, 2.0 second octave, ...).\n\n"
        "When the values are indices, the input will be treated as integers, e.g."
        " 0 corresponds to first element, 1 to second element, etc."
    };

    static inline const c74::min::description USE_INDEX_WITHOUT_OCTAVE{
        "Treat input values as indices (1) or phase-like values (0)."
        " When the values are phase-like, the inputs will be treated as phase values"
        " in range 0-1 (end exclusive).\n\n"
        "When the values are indices, the input will be treated as integers, e.g."
        " 0 corresponds to first element, 1 to second element, etc."
    };


    static inline const c74::min::description POLL_INTERVAL{
        "Set the rate in milliseconds at which the object triggers output,"
        " or @pollinterval 0 to trigger the object manually."
    };

    static inline const c74::min::description DETACHED_DESCRIPTION{
        "Enable object even when transport is disabled (default: false)"
    };


    static c74::min::description to_description(const std::string& s) {
        return s.c_str(); // NOLINT(*-redundant-string-cstr)
    }


    static c74::min::description append(const c74::min::description& d, const std::string& s) {
        return to_description(d + s);
    }
};

// ==============================================================================================


enum class Types { number, index, phase, trigger, pulse, boolean };

enum class Containers { value, voice, voices };


class Inlets {
public:
    Inlets() = delete;

    static inline const std::string NUMBER_TYPE = "number";
    static inline const std::string INDEX_TYPE = "index";
    static inline const std::string PHASE_TYPE = "phase";
    static inline const std::string TRIGGER_TYPE = "trigger";
    static inline const std::string PULSE_TYPE = "pulse";
    static inline const std::string BOOL_TYPE = "bool";

    static inline const std::string VALUE_CONTAINER; // never actually used
    static inline const std::string VOICE_CONTAINER = "list";
    static inline const std::string VOICES_CONTAINER = "multilist";

    static inline const std::string DUMPOUT = "(any) dumpout";

    static std::string type_to_string(Types type) {
        switch (type) {
            case Types::number:
                return NUMBER_TYPE;
            case Types::index:
                return INDEX_TYPE;
            case Types::phase:
                return PHASE_TYPE;
            case Types::trigger:
                return TRIGGER_TYPE;
            case Types::pulse:
                return PULSE_TYPE;
            case Types::boolean:
                return BOOL_TYPE;
        }
        throw std::invalid_argument("unknown type");
    }

    static std::string container_to_string(Containers container) {
        switch (container) {
            case Containers::value:
                return VALUE_CONTAINER;
            case Containers::voice:
                return VOICE_CONTAINER;
            case Containers::voices:
                return VOICES_CONTAINER;
        }
        throw std::invalid_argument("unknown container");
    }

    static std::string type_spec(Types type, Containers container) {
        if (container == Containers::value) {
            return type_to_string(type);
        }
        return container_to_string(container) + ": " + type_to_string(type);
    }

    static c74::min::description info(Types t, Containers c, const std::string& description) {
        std::stringstream ss;
        ss << "(" << type_spec(t, c) << ") " << description;
        return Descriptions::to_description(ss.str());
    }

    static c74::min::description trigger_info(const std::string& description) {
        return info(Types::trigger, Containers::voices, description); // trigger are always Voices<Trigger>
    }

    static c74::min::description pulse_info(const std::string& description) {
        return info(Types::pulse, Containers::voices, description); // pulses are always Voices<Trigger>
    }

    static c74::min::description value(Types t, const std::string& description) {
        return info(t, Containers::value, description);
    }

    static c74::min::description voice(Types t, const std::string& description) {
        return info(t, Containers::voice, description);
    }

    static c74::min::description voices(Types t, const std::string& description) {
        return info(t, Containers::voices, description);
    }
};


// ==============================================================================================

class Pseudo {
public:
    Pseudo() = delete;


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
