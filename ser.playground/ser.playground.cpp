
#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <types/phase.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_timepoint.h"
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

    message<> setup{this, "setup", "", setter{MIN_FUNCTION {
        cout << "ser.playground::setup" << endl;

        auto saved_state = state();
        if (saved_state.contains("saved_object_attributes")) {
            auto persistent_attributes_dict = dict{atom{saved_state.at("saved_object_attributes")}};
            cout << "persistent stuff..." << endl;
            if (persistent_attributes_dict.contains("autorestore")) {
                this->someint.set(saved_state["someint"]);
                this->somefloat.set(saved_state["somefloat"]);
                this->somesymbol.set(saved_state["somesymbol"]);
                this->somevector.set(saved_state["somevector"]);
                // this->set_voices(saved_state["voices"]);
            }
        }
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


    //
    // attribute<bool> autorestore{ this, "autorestore", false, saved{true}, category{"State"}, setter{
    //         MIN_FUNCTION {
    //             if (args.size() == 1 && args[0].type() == message_type::int_argument) {
    //                 return args;
    //             }
    //             return autorestore;
    // }}};


    message<> savestate { this, "savestate",
    MIN_FUNCTION {
        cout << "savestate called: ";
        dict d {args[0]};
        if (autorestore.get()) {
            cout << "storing values" << endl;
            d["my_custom_data"] = static_cast<int>(i);
            d.insert("someint", someint.get());
            d.insert("somefloat", somefloat.get());
            d.insert("somesymbol", somesymbol.get());
            d.insert("somevector", somevector.get_atoms());
            // d.insert("voices", m_voices);

            auto s = d["numinlets"];
            if (!s.empty()) {
                cout << "{found numinlets: " << s << "} ";
            } else {
                cout << "{did not find numinlets} ";
            }

        } else {
            cout << "(should be clearing state)" << endl;
            // d.clear();
        }

        return {};
    }
    };


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