
#include "c74_min.h"



#include "parsing.h"
#include "max_timepoint.h"

using namespace c74::min;


class playground : public object<playground> {
private:
    // member variables

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


    attribute<std::vector<double>> asdf{this, "asdf"
                                       , Vec<double>::singular(0.25).vector()
                                       , title{"Set minimum duration"}
                                       , description{""}
                                       , setter{MIN_FUNCTION {
                    return args;
            }}
    };




    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}};


    message<> test{this, "test", "(bang) test", MIN_FUNCTION {
        // TODO
        cout << "testing" << endl;
        outlet_main.send("test");
        return {};
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
            for (const auto& voice : *voices) {
                for (const auto& v : voice) {
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

    message<> anything{this, "anything", "Function depends on inlet", MIN_FUNCTION{
        cout << "anything" << endl;
        outlet_main.send("anything");
        return {};
    }};

private:



};


MIN_EXTERNAL(playground)