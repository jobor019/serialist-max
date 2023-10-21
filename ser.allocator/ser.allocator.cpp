
#include "c74_min.h"
#include "core/param/parameter_policy.h"
#include "core/generatives/unit_pulse.h"
#include "core/collections/vec.h"
#include "core/collections/voices.h"
#include "core/generatives/sequence.h"
#include "core/generatives/variable.h"
#include "core/generatives/allocator.h"

#include "parsing.h"


using namespace c74::min;

struct AllocatorWrapper {
    ParameterHandler parameter_handler;

    Sequence<Trigger> trigger{"", parameter_handler};
    Sequence<Facet, NoteNumber> pitch_classes{"", parameter_handler
                                              , Voices<NoteNumber>::transposed(Vec<NoteNumber>::range(12))};
    Variable<Facet, NoteNumber> pitch_pivot{"", parameter_handler, 12};
    Sequence<Facet, double> spectrum_distribution{"", parameter_handler
                                                  , Voices<double>::transposed(Vec<double>::repeated(12, 1.0))};
    Variable<Facet, bool> flush_on_change{"", parameter_handler, false};
    Variable<Facet, bool> enabled{"", parameter_handler, true};
    Variable<Facet, std::size_t> num_voices{"", parameter_handler, 0};

    AllocatorNode allocator{"", parameter_handler, &trigger, &pitch_classes, &pitch_pivot
                            , &spectrum_distribution, &flush_on_change, &enabled, &num_voices};
};


// ==============================================================================================

class allocator : public object<allocator> {
public:
    MIN_DESCRIPTION{"Multi-channel pitch material allocator"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.oscillator, ser.randpulse"};

    inlet<> inlet_main{this, "(any) control messages"};
    inlet<> inlet_pitches{this, "(list) enabled pitch classes"};
    inlet<> inlet_weights{this, "(list) band weights"};

    outlet<> outlet_note_ons{this, "(list) note on messages"};
    outlet<> outlet_note_offs{this, "(list) note off messages"};
    outlet<> dumpout{this, "(any) dumpout"};


    attribute<bool> autoflush{this, "autoflush"
                              , false
                              , title{"flush non-matching notes when pitch material changes"}
                              , setter{MIN_FUNCTION {
                if (set_flush_on_change(args))
                    return args;
                return autoflush;
            }}
    };

    attribute<std::vector<int>> pitches{this, "pitches"
                                        , Vec<int>::range(12).vector()
                                        , title{"enabled pitch classes of generated output"}
                                        , setter{MIN_FUNCTION {
                if (set_pitch_material(args))
                    return args;
                return pitches;
            }}
    };


    attribute<int> pivot{this, "pivot"
                         , 12
                         , title{""}
                         , setter{MIN_FUNCTION {
                if (set_pitch_pivot(args))
                    return args;
                return pivot;
            }}
    };


    attribute<std::vector<double>> weights{this, "weights"
                                           , Vec<double>::repeated(12, 1.0).vector()
                                           , title{""}
                                           , setter{MIN_FUNCTION {
                if (set_distribution(args))
                    return args;
                return weights;
            }}
    };


    attribute<bool> enabled{this, "enabled"
                            , true
                            , title{""}
                            , setter{MIN_FUNCTION {
                if (set_enabled(args))
                    return args;
                return enabled;
            }}
    };
    attribute<int> voices{this, "voices"
                          , 1
                          , title{""}
                          , setter{MIN_FUNCTION {
                if (set_num_voices(args))
                    return args;
                return voices;
            }}
    };

    message<> flush{this, "flush", "(bang) flush held notes", MIN_FUNCTION {
        // TODO
        cwarn << "flush is not implemented yet" << endl;
        return {};
    }};


    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            set_distribution(args);
            return {};
        } else if (inlet == 1) {
            set_pitch_material(args);
            return {};
        }

        process(args);
        return {};
    };

    message<> number{this, "number", "Function depends on inlet", handle_input};
    message<> list{this, "list", "Function depends on inlet", handle_input};
    // needed for messages beginning with 'null'
    message<> anything{this, "anything", "Function depends on inlet", handle_input};



private:
    void process(const atoms& args) {
        if (auto triggers = parsing::atoms2triggers(args)) {
            m_allocator.trigger.set_values(*triggers);
            std::cout << "triggers: ";
            (*triggers).as_type<int>().print();

            m_allocator.allocator.update_time(TimePoint());

            auto notes = m_allocator.allocator.process();
            std::cout << "notes: ";
            notes.as_type<int>([](const PartialNote& note) {
                if (note.get_note_number().has_value()) {
                    return static_cast<int>(*note.get_note_number());
                } else {
                    return -1;
                }
            }).print();
            auto [note_ons, note_offs] = notes.partition([](const auto& note) {
                if (auto trigger_type = note.get_trigger()) {
                    return *trigger_type == Trigger::pulse_on;
                }
                return false;
            });

            auto note_number_f = [](const PartialNote& note) {
                if (note.get_note_number().has_value()) {
                    return c74::min::atom(static_cast<int>(*note.get_note_number()));
                } else {
                    return c74::min::atom(parsing::NULL_STRING);
                }
            };

            auto parsed_notes_offs = parsing::voices2atoms<c74::min::atom>(note_offs, {note_number_f});
            auto parsed_note_ons =  parsing::voices2atoms<c74::min::atom>(note_ons, {note_number_f});

            if (parsed_note_ons.is_ok() && parsed_notes_offs.is_ok()) {
                outlet_note_offs.send(*parsed_notes_offs);
                outlet_note_ons.send(*parsed_note_ons);
            } else {
                cerr << "failed to parse notes" << endl;
            }
        }
    }


    bool set_flush_on_change(const atoms& args) {
        if (auto v = parsing::atoms2value<bool>(args)) {
            m_allocator.flush_on_change.set_value(*v);
            return true;
        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_pitch_material(const atoms& args) {
        if (auto v = parsing::atoms2vec<int>(args)) {
            auto pcs = Voices<unsigned int>::transposed((*v).as_type<unsigned int>());
            m_allocator.pitch_classes.set_values(pcs);
            return true;
        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_pitch_pivot(const atoms& args) {
        if (auto v = parsing::atoms2value<int>(args)) {
            m_allocator.pitch_pivot.set_value(static_cast<unsigned int>(*v));
            return true;
        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_distribution(const atoms& args) {
        if (auto v = parsing::atoms2vec<double>(args)) {
            m_allocator.spectrum_distribution.set_values(Voices<double>::transposed(*v));
            return true;
        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_enabled(const atoms& args) {
        if (auto v = parsing::atoms2value<bool>(args)) {
            m_allocator.enabled.set_value(*v);
            return true;
        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    bool set_num_voices(const atoms& args) {
        if (auto v = parsing::atoms2value<int>(args)) {
            m_allocator.num_voices.set_value(static_cast<std::size_t >(*v));
            return true;
        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }


    AllocatorWrapper m_allocator;

};

MIN_EXTERNAL(allocator)
