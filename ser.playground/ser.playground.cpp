
#include "c74_min.h"


#include "parsing.h"
#include "max_timepoint.h"
#include "core/generatives/sequence.h"
#include "core/generatives/variable.h"
//#include "stereotypes.h"

using namespace c74::min;

//template<typename ObjectType
//        , typename = std::enable_if_t<std::is_base_of_v<c74::min::object_base, ObjectType>>>
//inline attribute<bool> test2(ObjectType* obj) {
//    return c74::min::attribute<bool>{obj, "test", false, setter{[&obj](const atoms& args, const int inlet) {
//        return c74::min::atoms{};
//    }}};
//}

template<typename ObjectType
         , typename = std::enable_if_t<std::is_base_of_v<c74::min::object_base, ObjectType>>>
inline attribute<bool> test2(ObjectType* obj, const c74::min::function& f) {
//    obj->cout << "generic setter" << c74::min::endl;
    return c74::min::attribute<bool>{obj, "test", false, setter{[&](const atoms& args, const int inlet) {
        f(args, inlet);
        return c74::min::atoms{};
    }}};
}


template<typename MaxObjectClass>
class MaxNodeBase : public object<MaxObjectClass> {

    attribute<bool> create_attribute(const c74::min::function& f) {

    }

};


// try_set_internal: current, new, cerr, setter
// try_set_dynamic: current, new, cerr, qp<T> dynamic_object, dynamic_object's associated setter
inline c74::min::atoms generic_setter(const atoms& current_value
                                      , const atoms& new_value
                                      , c74::min::logger& cerr
                                      , const std::function<void(const atoms&)>& setter
) {
    try {
        setter(new_value);
        return new_value;
    } catch (const ResultError& e) {
        cerr << e.what() << endl;
        return current_value;
    }
}


template<typename T>
inline bool set_vector(const c74::min::atoms& args, Sequence<T>& seq, c74::min::logger& cerr) noexcept {
    try {
        auto e = Voices<bool>::transposed(AtomParser::atoms2vec<bool>(args).ok());
        seq.set_values(e);
        return true;
    } catch (ResultError& e) {
        cerr << e.what() << endl;
        return false;
    }
}


template<typename T>
inline bool set_voices(const c74::min::atoms& args
                       , Sequence<T>& seq
                       , c74::min::logger& cerr
                       , bool leading_bracket_stripped = false) noexcept {
    try {
        auto e = Voices<T>::transposed(AtomParser::atoms2voices<T>(args, leading_bracket_stripped).ok());
        seq.set_values(e);
        return true;
    } catch (ResultError& e) {
        cerr << e.what() << endl;
        return false;
    }
}


template<typename T>
inline bool set_value(const c74::min::atoms& args
                      , Variable<T>& variable
                      , c74::min::logger& cerr) noexcept {
    try {
        variable.set_value(AtomParser::atoms2value<T>(args).ok());
        return true;
    } catch (ResultError& e) {
        cerr << e.what() << endl;
        return false;
    }
}


class playground : public MaxNodeBase<playground> {
private:
    // member variables
    Voices<double> m_freqs = Voices<double>::empty_like();


public:
    MIN_DESCRIPTION{"Multi-channel random pulsator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.pulsator"};

    inlet<> inlet_main{this, "(any) control messages"};


    outlet<> outlet_main{this, "(float/list) pulse output"};
    outlet<> dumpout{this, "(any) dumpout"};


    explicit playground(const atoms& = {}) {
//        metro.delay(1.0);

    }


    timer<> metro{this, MIN_FUNCTION {
        metro.delay(1.0);
        return {};
    }};

//    attribute<bool> my_attribute{this, "my_attribute2", false, title{"Set minimum duration"}, description{"hehe"}, setter{MIN_FUNCTION{
//        return generic_setter(my_attribute, args, cerr, [this](const atoms& args) {
//            auto f = Voices<double>::transposed(AtomParser::atoms2vec<double>(args).ok());
//            m_freqs = f;
//        });

//        return generic_setter(my_attribute, &cerr, [&args]() {
//            auto v = AtomParser::atoms2vec<double>(args);
//            auto voices =  Voices<double>::transposed(*v);
//            m_oscillator.freq.set_values(voices);
//        });
//    }}};


//    attribute<bool> test = test2(this);
//    attribute<bool> test = test2(this, [this](const atoms& args, const int inlet) {
//        cout << "setting test" << endl;
//        return c74::min::atoms{};
//    });


    attribute<std::vector<double>> myattribute{this, "myattribute"
                                               , Vec<double>::singular(0.25).vector()
                                               , title{"Set minimum duration"}
                                               , description{""}
                                               , setter{MIN_FUNCTION {
                return args;
            }}
    };

    attribute<symbol> attributenotype{this, "attributenotype", "hello"
                                      , description{"take any type of argument"}
                                      , setter{MIN_FUNCTION {

                Result<void> result(Error("not working"));
                for (const auto& atm: args) {
                    if (atm.type() == c74::min::message_type::int_argument)
                        cout << "int: ";
                    if (atm.type() == c74::min::message_type::float_argument)
                        cout << "float: ";
                    if (atm.type() == c74::min::message_type::symbol_argument)
                        cout << "symbol: ";

                    cout << atm << endl;
                }
                return args;
            }}};


    message<> lol{this, "lol", "(list of list)", MIN_FUNCTION {
        for (const auto& atm: args) {
            cout << atm << endl;
        }
        return {};
    }};

//
    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}};
//    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}, setter{MIN_FUNCTION {
//        return args;
//    }}};


    message<> mymessage{this, "mymessage", "(bang) test", MIN_FUNCTION {
        // TODO
//        cout << patcher().name() << endl;
//        for (const auto& box: patcher().boxes()) {
//            cout << box.classname() << endl;
//        }

//        maxobj()
        cout << "test" << endl;

        outlet_main.send("test");
        return args;
    }};

//    c74::min::function handle_input = MIN_FUNCTION {
//        if (inlet == 3) {
//            set_pulse_width(args);
//        } else if (inlet == 2) {
//            set_upper_bound(args);
//            return {};
//        } else if (inlet == 1) {
//            set_lower_bound(args);
//            return {};
//        } else {
//            if (!args.empty())
//                cerr << "doesn't understand " << args[0] << endl;
//        }
//
//        return {};
//    };
//
//
//    message<> list{this, "list", "Function depends on inlet", handle_input};
//    message<> number{this, "number", "Function depends on inlet", handle_input};

    message<> plus{this, "+", "test", MIN_FUNCTION {
        cout << "plus" << endl;
        outlet_main.send("plus");
        return {};
    }};

    message<> list_of_lists{this, "[", "llll", MIN_FUNCTION {
        auto voices = AtomParser::atoms2voices<int>(args);
        if (voices) {
            cout << "parsed voices:" << endl;
            for (const auto& voice: *voices) {
                for (const auto& v: voice) {
                    cout << v << " ";
                }
                cout << endl;
            }
            cout << endl;
        } else {
            cout << "failed to parse voices (note that it only accepts ints!!)" << endl;
            return {};
        }

        auto atms = AtomFormatter::voices2atoms<int>(*voices);
        cout << "parsed atms:" << endl;
        outlet_main.send(atms);
        return {};
    }};

    message<> anything{this, "anything", "Function depends on inlet", MIN_FUNCTION {
        cout << "anything" << endl;
        outlet_main.send("anything");
        return {};
    }};

private:

};



//void playground_inletinfo(t_playground *x, void *b, long a, char *t)
//{
//    long i;
//
//    if (x->triggerlist[0] != -1) {
//        *t = 1;
//        for (i = 0; i < x->triggerlistlen; i++) {
//            if (join_is_trigger_inlet(x, a)) {
//                *t = 0;
//                break;
//            }
//        }
//    } else
//        *t = 0;
//}


MIN_EXTERNAL(playground)