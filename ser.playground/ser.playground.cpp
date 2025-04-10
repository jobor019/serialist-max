
#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <types/phase.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_timepoint.h"
#include "policies/epsilon.h"
#include "types/index.h"

using namespace c74::min;
using namespace serialist;



class ser_playground : public object<ser_playground> {
public:
    inlet<> inlet_main{this, "(any) control messages"};
    outlet<> outlet_main{this, "(float/list) pulse output"};

    explicit ser_playground(const atoms& args = {}) {
        cout << "ser.playground::constructor" << endl;
    }

    attribute<symbol> clock{this, "clock", "", description{"Set clock source"}};


    message<> bang{this, "bang", "A description", setter{MIN_FUNCTION {
        outlet_main.send(EPSILON);
        // auto t = SerialistTransport::get_instance().get_time().get_tick();
        // outlet_main.send(t);


        // if (auto tp = MaxTimePoint::get_time_of(clock.get())) {
        //     outlet_main.send(tp->to_atoms());
        // }
        return {};
    }}};


    message<> phasemax{this, "phasemax", "A description", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"phasemax\" for inlet " << inlet << endl;
            return {};
        }

        outlet_main.send("max", Phase::max());
        outlet_main.send("wrappoint", Phase::wrap_point());

        return {};
    }}};


    message<> index{this, "index", "A description", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"index\" for inlet " << inlet << endl;
            return {};
        }

        if (args.size() == 2 && args[0].type() == message_type::float_argument && args[1].type() == message_type::int_argument) {
            auto i = Index::index_op(args[0], args[1]);
            outlet_main.send(static_cast<long>(i));
        } else {
            cerr << "invalid message \"index\" for inlet " << inlet << endl;
        }

        return {};
    }}};

    message<> maxclass_setup { this, "maxclass_setup",
    MIN_FUNCTION {
        cout << "epsilon: " << EPSILON << endl;
        return {};
    }
    };





};


MIN_EXTERNAL(ser_playground)