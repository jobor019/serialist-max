
#include <core/policies/policies.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_timepoint.h"

using namespace c74::min;
using namespace serialist;


class ser_playground : public object<ser_playground> {
public:
    inlet<> inlet_main{this, "(any) control messages"};
    outlet<> outlet_main{this, "(float/list) pulse output"};

    explicit ser_playground(const atoms& args = {}) {
        cout << "ser.playground::constructor" << endl;
    }

    attribute<std::vector<double>> myattr{this, "myattr", {}, setter{
            MIN_FUNCTION {
                if (AtomParser::atoms2vec<double>(args)) {
                    cout << "myattr" << endl;
                    outlet_main.send(args);
                    return args;
                }
                return myattr;
            }
    }};

    message<> setup{this, "setup", MIN_FUNCTION {
        if (myattr.get().empty()) {
            error("failed instantiation of object since attribute myattr is empty");
        }
        return {};
    }};

};


MIN_EXTERNAL(ser_playground)