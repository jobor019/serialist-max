
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

    timer<> deliverer{this, MIN_FUNCTION {
        outlet_main.send(someattribute.get_atoms());
        return {};
    }};

    explicit ser_playground(const atoms& = {}) {
        deliverer.delay(100.0);
    }

    attribute<int> someattribute{this, "someattribute", 0, setter{
            MIN_FUNCTION {
                outlet_main.send(args);
                return args;
            }
    }};
};


MIN_EXTERNAL(ser_playground)