#include <serialist_transport.h>
#include <core/policies/policies.h>
#include "generatives/sample_and_hold.h"

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"


using namespace c74::min;


class ser_snh : public object<ser_snh> {
private:
    SampleAndHoldWrapper<> m_snh;

public:
    MIN_DESCRIPTION{""};
    MIN_TAGS{""};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.phasepulse, ser.oscillator"};

    inlet<> inlet_main{this, "(float/list/listoflists) voices to hold", ""};
    inlet<> inlet_hold{this, "(float/list) hold state", ""};

    outlet<> outlet_main{this, "(int/list) output"};
    outlet<> dumpout{this, "(any) dumpout"};


    attribute<bool> enabled{this, AttributeNames::ENABLED
                           , true
                           , title{Titles::ENABLED}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_snh.enabled, cerr))
                return args;
            return enabled;
        }}
    };

    attribute<int> voices{this, AttributeNames::NUM_VOICES
                          , 0
                          , title{Titles::NUM_VOICES}
        , description{Descriptions::ENABLED}
        , setter{MIN_FUNCTION {
            if (AttributeSetters::try_set_value(args, m_snh.num_voices, cerr))
                return args;
            return voices;
        }}
    };


    message<> lhs{this, "lhs", MIN_FUNCTION {
        this->set_lhs(args);
        this->process();
        return {};
    }};

    message<> hold{this, "hold"
        , MIN_FUNCTION {
            this->set_hold(args);
            return {};
    }};



    function handle_input = MIN_FUNCTION {
        if (inlet == 1) {
            this->set_hold(args);
        } else {
            this->set_lhs(args);
        }
        this->process();

        return {};
    };


    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void set_hold(const atoms& args) {
        AttributeSetters::try_set_vector(args, m_snh.hold_state, cerr);
    }

    void set_lhs(const atoms& args) {
        AttributeSetters::try_set_vector(args, m_snh.input_value, cerr);
    }

    void process() {
        auto time = SerialistTransport::get_instance().get_time();
        if (!time.get_transport_running()) {
            return;
        }

        auto& node = m_snh.sample_and_hold;

        node.update_time(time);
        auto output = node.process();

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }


};


MIN_EXTERNAL(ser_snh);