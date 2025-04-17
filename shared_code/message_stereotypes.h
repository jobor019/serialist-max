
#ifndef SERIALIST_MAX_MESSAGE_STEREOTYPES_H
#define SERIALIST_MAX_MESSAGE_STEREOTYPES_H

#include "c74_min_api.h"
#include "max_stereotypes.h"
#include "parsing.h"
#include "save_state.h"

class Messages {
public:
    Messages() = delete;


    static c74::min::message<> bang_message(
        c74::min::object_base* obj
        , const c74::min::function& handle_input
        , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET
    ) noexcept {
        return c74::min::message<>{obj, "bang", description, handle_input};
    }


    static c74::min::message<> list_message(
        c74::min::object_base* obj
        , const c74::min::function& handle_input
        , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET
    ) noexcept {
        return c74::min::message<>{obj, "list", description, handle_input};
    }


    static c74::min::message<> number_message(
        c74::min::object_base* obj
        , const c74::min::function& handle_input
        , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET
    ) noexcept {
        return c74::min::message<>{obj, "number", description, handle_input};
    }


    static c74::min::message<> list_of_list_message(
        c74::min::object_base* obj
        , const c74::min::function& handle_input
        , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET_MULTILIST
    ) noexcept {
        return c74::min::message<>{obj
                                   , "["
                                   , description
                                   , c74::min::setter{
                                       [&handle_input](const c74::min::atoms& args, const int inlet) {
                                           auto formatted = AtomParser::prepend_leading_bracket(args);
                                           handle_input(formatted, inlet);
                                           return c74::min::atoms();
                                       }
                                   }
        };
    };


    // needed for messages beginning with 'null'
    static c74::min::message<> anything_message(
        c74::min::object_base* obj
        , const c74::min::function& handle_input
        , const c74::min::description& description = Descriptions::DEPENDS_ON_INLET
    ) noexcept {
        return c74::min::message<>{obj, "anything", description, handle_input};
    }


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    static c74::min::message<> setup_message_with_loadstate(
        c74::min::object_base* obj
        , std::function<void(LoadState&)> handle_input) {
        return c74::min::message<>{
            obj
            , "setup"
            , ""
            , c74::min::setter{[obj, f = std::move(handle_input)](const c74::min::atoms&, const int) {
                    LoadState s{obj->state()};
                    f(s);
                    return c74::min::atoms{};
            }}
        };
    }

    static c74::min::message<> savestate_message(
        c74::min::object_base* obj
        , c74::min::attribute<bool>& autorestore_obj
        , SaveState::Setter handle_input) {
        return c74::min::message<>{
            obj
            , "savestate"
            , ""
            , c74::min::setter{[&autorestore_obj, f = std::move(handle_input)](const c74::min::atoms& atms, const int) {
                SaveState s{atms, autorestore_obj.get()};
                f(s);
                return c74::min::atoms{};
            }}
        };
    }
};

#endif //SERIALIST_MAX_MESSAGE_STEREOTYPES_H
