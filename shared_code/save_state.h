#ifndef SERIALIST_MAX_SAVE_STATE_H
#define SERIALIST_MAX_SAVE_STATE_H

#include "c74_min_api.h"
#include "serialist_attributes.h"

/**
 * Class for saving state using the `savestate` message method. A typical use case would look like this:
 *
 * message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
 *     s >> this->someint >> this->somefloat >> this->somesymbol >> this->somevector >> this->somepseudo;
 * });
 *
 * (Or the more verbose form):
 *
 * message<> savestate { this, "savestate",
 *     MIN_FUNCTION {
 *         SaveState s{args, autorestore.get()};
 *         s << someint << somefloat << somesymbol << somevector << somepseudo;
 *         return {};
 *     }
 * };
 */
class SaveState {
public:
    using Setter = std::function<void(SaveState&)>;

    // Note: this should only be called in the `savestate` message method.
    //       There are no input validity checks in this class, it always expects a dict.
    explicit SaveState(const c74::min::atoms& args, bool should_save_state)
        : m_dict{args[0]}
        , m_should_save_state{should_save_state} {}


    friend SaveState& operator<<(SaveState& s, const pseudo_attribute_base& attr) {
        s.store(attr.name(), attr.get_stored_atoms());
        return s;
    }


    friend SaveState& operator<<(SaveState& s, const c74::min::attribute_base& attr) {
        s.store(attr.name(), attr);
        return s;
    }


    /** check for attribute name clashes with reserved keywords in the `box` dict of a maxclass */
    static void assert_valid_key(const std::string& key) {
        assert(key != "id");
        assert(key != "maxclass");
        assert(key != "numinlets");
        assert(key != "numoutlets");
        assert(key != "outlettype");
        assert(key != "text");
    }

private:
    void store(const std::string& name, const c74::min::atoms& value) {
        if (m_should_save_state) {
            assert_valid_key(name);
            m_dict.insert(name, value);
        }
    }


    c74::min::dict m_dict;
    bool m_should_save_state;
};


// ==============================================================================================

/**
 * Class for restoring saved state using the `setup` message method. A typical use case would look like this:
 *
 * message<> setup = Messages::setup_with_loadstate(this, [this](LoadState& s) {
 *         s >> this->someint >> this->somefloat >> this->somesymbol >> this->somevector >> this->somepseudo;
 * });
 *
 * (Or the more verbose form):
 *
 * message<> setup{this, "setup", "", setter{MIN_FUNCTION {
 *     LoadState s{state()};
 *     s >> this->someint >> this->somefloat >> this->somesymbol >> this->somevector >> this->somepseudo;
 *     return {};
 * }}};
 */
class LoadState {
public:
    using Getter = std::function<void(LoadState&)>;

    static const inline std::string SAVED_ATTRIBUTES_DICT_NAME = "saved_object_attributes";



    explicit LoadState(const c74::min::dict& state_dict)
        : m_state_dict{state_dict}
        , m_should_restore_state(should_restore_state(state_dict)) {}


    /** restores state only if (a) `autorestore` is set to 1 and (b) the attribute is present in the `box` dict */
    friend LoadState& operator>>(LoadState& s, pseudo_attribute_base& attr) {
        if (s.m_should_restore_state && s.m_state_dict.contains(attr.name())) {
            attr.set(s.m_state_dict[attr.name()]);
        }

        return s;
    }


    /** restores state only if (a) `autorestore` is set to 1 and (b) the attribute is present in the `box` dict */
    friend LoadState& operator>>(LoadState& s, c74::min::attribute_base& attr) {
        if (s.m_should_restore_state && s.m_state_dict.contains(attr.name())) {
            attr.set(s.m_state_dict[attr.name()]);
        }

        return s;
    }

private:
    /**
     * State should only be restored if the `autorestore` attribute is set to 1. In our (box) dict, this means that
     * there's a dict "saved_object_attributes" containing "autorestore": 1, i.e. the following format:
     *  "box": {
     *      ...
     *      "saved_object_attributes": {
     *          "autorestore" : 1
     *          ...
     *      }
     *  }
     */
    static bool should_restore_state(const c74::min::dict& d) {
        if (d.contains(SAVED_ATTRIBUTES_DICT_NAME)) {
            auto inner = c74::min::dict{c74::min::atom{*d.get(SAVED_ATTRIBUTES_DICT_NAME)}};
            if (auto auto_restore_values = inner.get(AttributeNames::AUTO_RESTORE)) {
                if (!auto_restore_values->empty()) {
                    auto atm = static_cast<c74::min::atom>(*auto_restore_values);
                    return atm.type() == c74::min::message_type::int_argument && static_cast<bool>(atm);
                }
            }

        }
        return false;
    }


    c74::min::dict m_state_dict;

    bool m_should_restore_state;
};


#endif //SERIALIST_MAX_SAVE_STATE_H
