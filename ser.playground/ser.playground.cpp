
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
    inlet<> inlet_main{this, "(any) control messages"};
    outlet<> outlet_main{this, "(float/list) pulse output"};


};


MIN_EXTERNAL(ser_playground)