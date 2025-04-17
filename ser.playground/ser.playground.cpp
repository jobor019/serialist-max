
#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <types/phase.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_timepoint.h"
#include "message_stereotypes.h"
#include "save_state.h"
#include "serialist_attributes.h"
#include "generatives/operator.h"
#include "generatives/oscillator.h"
#include "policies/epsilon.h"
#include "types/index.h"

using namespace c74::min;
using namespace serialist;

#define SER_ATTRIBUTE_VALUE_SETTER(NAME, TARGET_MEMBER, MUTEX) \
    setter{ \
            MIN_FUNCTION { \
                if (AttributeSetters::try_set_value(args, TARGET_MEMBER, cerr, MUTEX)) \
                    return args; \
                return NAME; \
            } \
        }


#define SER_ATTRIBUTE_VECTOR_SETTER(NAME, TARGET_MEMBER, MUTEX) \
    setter{ \
            MIN_FUNCTION { \
                if (AttributeSetters::try_set_vector(args, TARGET_MEMBER, cerr, MUTEX)) \
                    return args; \
                return NAME; \
            } \
        }

#define SER_ATTRIBUTE_VECTOR_SINGULAR_SETTER(NAME, TARGET_MEMBER, MUTEX) \
    setter{ \
            MIN_FUNCTION { \
                if (AttributeSetters::try_set_vector_singular(args, TARGET_MEMBER, cerr, MUTEX)) \
                    return args; \
                return NAME; \
            } \
        }

#define SER_VALUE_ATTRIBUTE(NAME, TYPE, DEFAULT_VALUE, TARGET_MEMBER, MUTEX) \
    attribute<TYPE> NAME { \
        this \
        , AttributeSetters::format_name(#NAME) \
        , DEFAULT_VALUE \
        , title{AttributeSetters::format_title(#NAME)}  \
        , SER_ATTRIBUTE_VALUE_SETTER(NAME, TARGET_MEMBER, MUTEX) \
    }

#define SER_VECTOR_ATTRIBUTE(NAME, TYPE, DEFAULT_VALUE, TARGET_MEMBER, MUTEX) \
    attribute<std::vector<TYPE>> NAME { \
        this \
        , AttributeSetters::format_name(#NAME) \
        , {DEFAULT_VALUE} \
        , title{AttributeSetters::format_title(#NAME)}  \
        , SER_ATTRIBUTE_VECTOR_SETTER(NAME, TARGET_MEMBER, MUTEX) \
    }

// ==============================================================================================


class ser_playground : public object<ser_playground> {
public:
    OscillatorWrapper<> w;

    std::mutex m_mutex;


    std::size_t i = 0;

    inlet<> inlet_main{this, "(any) control messages"};
    outlet<> outlet_main{this, "(float/list) pulse output"};

    SER_ENABLED_ATTRIBUTE(w.enabled, &m_mutex);
    SER_NUM_VOICES_ATTRIBUTE(w.num_voices, &m_mutex);
    SER_AUTO_RESTORE_ATTRIBUTE();

    value_attribute<PaMode> mode{this, "mode", w.mode, PhaseAccumulator::DEFAULT_MODE, cerr};

    vector_attribute<double> period{this, "period", w.period, PaParameters::DEFAULT_PERIOD, cerr};

    // message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
    //     s >> this->someint >> this->somefloat >> this->somesymbol >> this->somevector >> this->somepseudo;
    // });

    message<> setup{this, "setup", "", setter{MIN_FUNCTION {
        cout << "setup args size: " << args.size() << endl;
        LoadState s{state()};
        s >> this->someint >> this->somefloat >> this->somesymbol >> this->somevector >> this->somepseudo;
        return {};
    }}};

    message<> bang{this, "bang", "A description", setter{MIN_FUNCTION {
        i += 1;
        return {};
    }}};

    attribute<int> someint{ this, "someint", 0};
    attribute<double> somefloat{ this, "somefloat", 0};
    attribute<symbol> somesymbol{ this, "somesymbol", ""};
    attribute<std::vector<int>> somevector{ this, "somevector", {0}};
    pseudo_attribute<double> somepseudo{ this, "somepseudo", w.curve, cerr};


    //
    // attribute<bool> autorestore{ this, "autorestore", false, saved{true}, category{"State"}, setter{
    //         MIN_FUNCTION {
    //             if (args.size() == 1 && args[0].type() == message_type::int_argument) {
    //                 return args;
    //             }
    //             return autorestore;
    // }}};

    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << someint << somefloat << somesymbol << somevector << somepseudo;
    });

    // message<> savestate{this, "savestate", "", setter{MIN_FUNCTION {
    //     SaveState s{args, autorestore.get()};
    //     s << someint << somefloat << somesymbol << somevector << somepseudo;
    //     return {};
    // }}};

    // message<> savestate { this, "savestate",
    // MIN_FUNCTION {
    //     if (autorestore.get()) {
    //         SaveState s{args};
    //         s << someint << somefloat << somesymbol << somevector << somepseudo;
    //         cout << "stored values" << endl;
    //
    //     } else {
    //         cout << "(should be clearing state)" << endl;
    //         // d.clear();
    //     }
    //
    //     return {};
    // }
    // };


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