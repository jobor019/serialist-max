
#include <core/policies/policies.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_timepoint.h"

using namespace c74::min;
using namespace serialist;


class ser_playground : public object<ser_playground> {
private:


public:
    MIN_DESCRIPTION{"Multi-channel random pulsator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.pulsator"};

    inlet<> inlet_main{this, "(any) control messages"};


    outlet<> outlet_main{this, "(float/list) pulse output"};
    outlet<> dumpout{this, "(any) dumpout"};

    attribute<std::vector<int>> someattribute{ this, "someattribute", {0}, setter{
            MIN_FUNCTION {
                if (AtomParser::atoms2vec<int>(args)) {
                    cout << "setting someattribute!" << endl;
					return args;
				}
                
                cerr << "bad argument for message \"someattribute\"" << endl;
                return someattribute;
            }
        }
    };

    message<> somemessage{this, "somemessage", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"somemessage\" for inlet " << inlet << endl;
            return {};
        }

        someattribute.set(args);
        return {};
    }}};

};



MIN_EXTERNAL(ser_playground)