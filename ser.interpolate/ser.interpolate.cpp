#include <core/policies/policies.h>
#include <core/generatives/interpolator.h>

#include "c74_min.h"
#include "inlet_triggers.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "message_stereotypes.h"
#include "serialist_attributes.h"
#include "serialist_transport.h"

using namespace c74::min;
using namespace serialist;


class ser_interpolate : public object<ser_interpolate> {
private:
    using InterpolatorT = InterpolatorDoubleWrapper<>::InterpolatorT;

    static const inline auto CURSOR_DESCRIPTION = Inlets::voices(Types::number, "Set interpolation cursor");
    static const inline auto CORPUS_DESCRIPTION = Inlets::voices(Types::number, "Set corpus to interpolate");

    static const inline auto SIZE_INFO = "size";
    static const inline auto CURSOR_INDEX_INFO = "index";
    static const inline auto CURSOR_PHASE_INFO = "phase";
    static const inline auto OUTPUT_INDEX_INFO = "output";
    static const inline auto MODE_INFO = "mode";

    static constexpr std::size_t TRIGGER_INLET = 0;
    static constexpr std::size_t CURSOR_INLET = 1;
    static constexpr std::size_t CORPUS_INLET = 2;

    // for now, we'll only support the default / facet interpolator
    InterpolatorDoubleWrapper<> m_interpolator;

    InletTriggerHandler m_inlet_triggers{true, false, false};




public:
    MIN_DESCRIPTION{"Multi-channel memory interpolator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.pulsator, ser.phase, ser.pattern"};

    inlet<> inlet_main{this, Inlets::trigger_info("Trigger output"), "", [this] { return is_hot(TRIGGER_INLET); }};
    inlet<> inlet_cursor{this, CURSOR_DESCRIPTION, "", [this] { return is_hot(CURSOR_INLET); }};
    inlet<> inlet_corpus{this, CORPUS_DESCRIPTION, "", [this] { return is_hot(CORPUS_INLET); }};

    outlet<> outlet_main{this, Inlets::voices(Types::number, "Interpolated output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    // Only for documentation, type is not restrictive
    argument<atoms> corpus_arg{this, "corpus", "same as \"corpus\" message"};

    explicit ser_interpolate(const atoms& args = {}) {
        if (!args.empty()) {
            corpus.set(args);
        }
    }


    SER_ENABLED_ATTRIBUTE(m_interpolator.enabled, nullptr);
    SER_NUM_VOICES_ATTRIBUTE(m_interpolator.num_voices, nullptr);
    SER_AUTO_RESTORE_ATTRIBUTE();


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


    value_attribute<InterpolatorT::Mode> mode{this, "mode", m_interpolator.mode, InterpolatorT::DEFAULT_MODE, cerr};


    value_attribute<bool> uses_index{this, AttributeNames::USE_INDEX
        , m_interpolator.uses_index, InterpolatorT::DEFAULT_USES_INDEX, cerr
        , Titles::USE_INDEX, nullptr, Descriptions::USE_INDEX_WITH_OCTAVES};


    vector_attribute<double> octave{this, "octave", m_interpolator.octave, {12.0}, cerr
        , "", nullptr, description{"Set the octave to use in mode \"cont\""}};


    pseudo_attribute<double> corpus{this, "corpus", m_interpolator.corpus, cerr, CORPUS_DESCRIPTION
      , input_format::voices, nullptr, [this] {
          if (is_hot(CORPUS_INLET)) {
              // Note: we're intentionally using cursor here, not corpus
              process(InletTriggerHandler::triggers_like(m_interpolator.cursor.get_values()));
          }

          atoms size_info{SIZE_INFO};
          size_info.emplace_back(m_interpolator.corpus.get_values().size());
          dumpout.send(size_info);

    }};


    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        // Cursor is a runtime message, not pseudo-attribute. Won't be stored.
        s >> enabled >> voices >> triggers >> mode >> uses_index >> octave >> corpus;
    });


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        // Cursor is a runtime message, not pseudo-attribute. Not stored.
        s << enabled << voices << triggers << mode << uses_index << octave << corpus;
    });


    function handle_input = MIN_FUNCTION {
        if (inlet == CORPUS_INLET) {
            corpus.set(args);
        } else if (inlet == CURSOR_INLET) {
            update_cursor(args);
        } else if (is_hot(TRIGGER_INLET)){
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
    void update_cursor(const atoms& args) {
        if (set_cursor(args)) {
            if (is_hot(CURSOR_INLET)) {
                process(InletTriggerHandler::triggers_like(m_interpolator.cursor.get_values()));
            }
        }
    }


    void process(const atoms& atms) {
        if (!SerialistTransport::get_instance().active()) {
            return;
        }

        if (atms.empty()) {
            // bang received: trigger all voices
            process(Voices<Trigger>::singular(Trigger::pulse_on()));
        } else {
            auto triggers = AtomParser::atoms2triggers(atms, false);

            if (!triggers || triggers->is_empty_like()) {
                return;
            }

            process(*triggers);
        }
    }


    void process(const Voices<Trigger>& triggers) {
        if (!SerialistTransport::get_instance().active()) {
            return;
        }

        auto& trigger = m_interpolator.trigger;
        trigger.set_values(triggers);


        auto& node = m_interpolator.interpolator;
        node.update_time(SerialistTransport::get_instance().get_time());
        auto output = node.process();

        trigger.set_values(Voices<Trigger>::empty_like());

        dump_indices();

        auto formatted_atoms = AtomFormatter::voices2atoms<float>(output);
        outlet_main.send(formatted_atoms);

    }


    bool set_cursor(const atoms& args) {
        if (auto cursor = AtomParser::atoms2voices<double>(args); cursor.is_ok()) {
            m_interpolator.cursor.set_values(cursor.ok());

            auto cursor_info{args};
            if (m_interpolator.uses_index.get_value()) {
                cursor_info.insert(cursor_info.begin(), CURSOR_INDEX_INFO);
            } else {
                cursor_info.insert(cursor_info.begin(), CURSOR_PHASE_INFO);
            }
            dumpout.send(cursor_info);

            return true;
        } else {
            cerr << cursor.err().message() << endl;
            return false;
        }
    }


    bool is_hot(std::size_t i) const {
        return m_inlet_triggers.is_hot(i);
    }


    void dump_indices() {
        auto indices = m_interpolator.interpolator.previous_indices();
        auto interp_mode = mode.get();
        auto corpus_size = m_interpolator.corpus.get_values().size();

        atoms output_info{OUTPUT_INDEX_INFO};
        for (const auto& i : indices) {
            if (!i) { // NOLINT(*-branch-clone)
                output_info.emplace_back("null");
            } else if (auto parsed_index = i->get(corpus_size, interp_mode)){
                output_info.emplace_back(static_cast<int>(*parsed_index));
            } else {
                output_info.emplace_back("null"); // Mode::pass
            }
        }
        dumpout.send(output_info);
    }
};


MIN_EXTERNAL(ser_interpolate);