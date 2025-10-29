#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/patternizer.h>

#include "c74_min.h"
#include "inlet_triggers.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"
#include "message_stereotypes.h"


using namespace c74::min;

class ser_pattern : public object<ser_pattern> {
private:
    using PatternizerT = PatternizerDoubleWrapper<>::PatternizerT;

    static const inline auto PATTERN_DESCRIPTION = Inlets::voices(Types::number, "Set pattern to use");
    static const inline auto CHORD_DESCRIPTION = Inlets::voices(Types::number, "Set chord(s) to apply pattern to");

    static constexpr std::size_t TRIGGER_INLET = 0;
    static constexpr std::size_t PATTERN_INLET = 1;
    static constexpr std::size_t CHORD_INLET = 2;

    // for now, we'll only support the default / facet patternizer
    PatternizerDoubleWrapper<> m_patternizer;

    InletTriggerHandler m_inlet_triggers{true, false, false};

public:
    MIN_DESCRIPTION{""};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.interpolate"};

    inlet<> inlet_main{this, Inlets::trigger_info("Trigger output"), "", [this] { return is_hot(TRIGGER_INLET); }};
    inlet<> inlet_pattern{this, PATTERN_DESCRIPTION, "", [this] { return is_hot(PATTERN_INLET); }};
    inlet<> inlet_chord{this, CHORD_DESCRIPTION, "", [this] { return is_hot(CHORD_INLET); }};

    outlet<> outlet_main{this, Inlets::voices(Types::number, "Pattern output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    // Only for documentation, type is not restrictive
    argument<atoms> pattern_arg{this, "pattern", "same as \"pattern\" message"};

    explicit ser_pattern(const atoms& args = {}) {
        if (!args.empty()) {
            pattern.set(args);
        }
    }


    SER_ENABLED_ATTRIBUTE(m_patternizer.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_patternizer.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();
    SER_DETACH_ATTRIBUTE_STATELESS();


    attribute<std::vector<int>> triggers{this
                                      , AttributeNames::TRIGGERS
                                      , {0}
        , Titles::TRIGGERS
        , Descriptions::INLET_TRIGGERS
        , setter{MIN_FUNCTION {
            if (m_inlet_triggers.try_set_triggers_from_index_list(args, cerr)) {
                return args;
            }
            return triggers;
        }}};


    value_attribute<PatternizerT::Mode> mode{this, "mode", m_patternizer.mode, PatternizerT::DEFAULT_MODE, cerr};


    value_attribute<bool> inverse{this, "inverse", m_patternizer.inverse, PatternizerT::DEFAULT_INVERTED, cerr
    , "", nullptr, description{"Invert the pattern"}};


    value_attribute<bool> uses_index{this, AttributeNames::USE_INDEX
        , m_patternizer.pattern_uses_index, PatternizerT::DEFAULT_PATTERN_USES_INDEX, cerr
        , Titles::USE_INDEX, nullptr, Descriptions::USE_INDEX_WITH_OCTAVES};


    vector_attribute<double> octave{this, "octave", m_patternizer.octave, {12.0}, cerr
    , "", nullptr, description{"Set the octave to use in mode \"cont\""}};


    pseudo_attribute<double> chord{this, "chord", m_patternizer.chord, cerr, CHORD_DESCRIPTION
        , input_format::voices, nullptr, [this] {
            if (is_hot(CHORD_INLET)) {
                process(InletTriggerHandler::triggers_like(m_patternizer.chord.get_values()));
            }

        }};

    pseudo_attribute<double> pattern{this, "pattern", m_patternizer.pattern, cerr, PATTERN_DESCRIPTION
    , input_format::voices, nullptr, [this] {
        if (is_hot(PATTERN_INLET)) {
            process(InletTriggerHandler::triggers_like(m_patternizer.pattern.get_values()));
        }
    }};

    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> voices >> triggers >> mode >> inverse >> uses_index >> octave >> pattern >> chord >> detach;
    });

    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << voices << triggers << mode << inverse << uses_index << octave << pattern << chord << detach;
    });

    function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            chord.set(args);
        } else if (inlet == 1) {
            pattern.set(args);
        } else if (is_hot(TRIGGER_INLET)) {
            process(args);
        }
        return {};
    };

    message<> bang = Messages::bang_message(this, handle_input);
    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);


private:
    void process(const atoms& atms) {
        if (atms.empty()) {
            // bang received: trigger all voices
            process(Voices<Trigger>::singular(Trigger::pulse_on()));
        } else {
            auto triggers = AtomParser::atoms2triggers(atms, false);

            if (!triggers || !Trigger::contains_pulse_on(*triggers)) {
                return;
            }

            process(*triggers);
        }
    }


    void process(const Voices<Trigger>& triggers) {
        auto& trigger = m_patternizer.trigger;
        trigger.set_values(triggers);

        auto time = SerialistTransport::get_instance().get_time();
        SerialistTransport::apply_detach(time, detach.get());

        if (!time.get_transport_running()) {
            return;
        }

        auto& node = m_patternizer.patternizer_mode;
        node.update_time(time);
        auto output = node.process();

        trigger.set_values(Voices<Trigger>::empty_like());

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);
    }


    bool is_hot(std::size_t i) const {
        return m_inlet_triggers.is_hot(i);
    }
};




MIN_EXTERNAL(ser_pattern);