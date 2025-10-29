#include "c74_min.h"
#include "max_stereotypes.h"

using namespace c74::min;

class MidiNoteSegmenter {
public:
    static constexpr double DEFAULT_SEGMENTATION_WINDOW_MS = 60.0;
    static constexpr double DEFAULT_EXTENSION_PERIOD_MS = 30.0;


    enum class State : uint8_t {
        segment_end = 0
        , segment_start = 1
        , ongoing_segment = 2
        , segment_extension = 3
    };

    static const inline std::string STATE_TRANSLATION{"0: segment end, 1: segment start, 2: ongoing segment, 3: segment extension"};


    struct ChordAndState {
        ChordAndState(Vec<NoteNumber>&& notes, State state) : notes(notes), state(state) {}

        Vec<NoteNumber> notes;
        State state;
    };


    /** @returns Vec<NoteNumber> at the end of a segmentation window, std::nullopt otherwise */
    std::optional<Vec<NoteNumber>> poll() {
        if (!has_ongoing_window()) {
            return std::nullopt;
        }

        assert(m_last_callback_timestamp.has_value());
        assert(m_remaining_window > 0.0);

        auto now = std::chrono::steady_clock::now();
        auto elapsed_ms = static_cast<double>(std::chrono::duration_cast<std::chrono::microseconds>(
                              now - *m_last_callback_timestamp).count()) * 0.001;

        m_remaining_window -= elapsed_ms;
        m_last_callback_timestamp = now;

        if (m_remaining_window <= 0.0) {
            terminate_window();
            return m_held_sorted.get_held();
        }

        return std::nullopt;
    }


    std::optional<ChordAndState> process_input(NoteNumber note, uint16_t velocity) {
        bool changed = false;
        if (velocity > 0) {
            changed = bind_note(note);
        } else {
            changed = release_note(note);
        }

        if (changed) {
            auto state = update_state_on_input();
            auto held = m_held_sorted.get_held();
            return ChordAndState{std::move(held), state};
        }

        return std::nullopt;
    }


    /** @return true if there was anything to flush */
    bool flush() {
        terminate_window();
        return !m_held_sorted.flush().empty();
    }


    void set_segmentation_window_ms(double w) { m_segmentation_window_ms = std::max(0.0, w); }
    void set_extension_period_ms(double e) { m_extension_period_ms = std::max(0.0, e); }

private:
    /** @return true if note was added */
    bool bind_note(NoteNumber nn) {
        return m_held_sorted.bind(nn);
    }


    /** @return true if note was released */
    bool release_note(NoteNumber nn) {
        auto num_held = m_held_sorted.get_held();
        m_held_sorted.release(nn);
        return num_held != m_held_sorted.get_held();
    }


    /** @return true if window was extended */
    bool extend_window() {
        auto extension_duration = m_extension_period_ms;

        if (m_remaining_window < extension_duration) {
            m_remaining_window = extension_duration;
            return true;
        }

        return false;
    }


    State update_state_on_input() {
        if (has_ongoing_window()) {
            bool extended = extend_window();
            return extended ? State::segment_extension : State::ongoing_segment;

        } else {
            new_window();
            return State::segment_start;
        }
    }


    bool has_ongoing_window() const {
        return m_remaining_window > 0.0;
    }


    void new_window() {
        m_remaining_window = m_segmentation_window_ms;
        m_last_callback_timestamp = std::chrono::steady_clock::now();
    }


    void terminate_window() {
        m_remaining_window = 0.0;
        m_last_callback_timestamp = std::nullopt;
    }


    double m_segmentation_window_ms = DEFAULT_SEGMENTATION_WINDOW_MS;
    double m_extension_period_ms = DEFAULT_EXTENSION_PERIOD_MS;


    Held<NoteNumber, false, true> m_held_sorted;
    double m_remaining_window{0.0};
    std::optional<std::chrono::steady_clock::time_point> m_last_callback_timestamp = std::nullopt;

};


// ==============================================================================================


class ser_chordthresh : public object<ser_chordthresh> {
private:
    static const inline description STATE_OUTLET_DESCRIPTION = Descriptions::to_description(
        "segmentation state (" + MidiNoteSegmenter::STATE_TRANSLATION + ")");

    static const inline description WINDOW_DESCRIPTION = Descriptions::to_description(
        "segmentation window (ms), default: " + std::to_string(MidiNoteSegmenter::DEFAULT_SEGMENTATION_WINDOW_MS)
    );

    static const inline description EXTENSION_DESCRIPTION = Inlets::value(Types::number,
        "extension period (ms), default: " + std::to_string(MidiNoteSegmenter::DEFAULT_EXTENSION_PERIOD_MS)
        + ".\n Each time a new note is received, the segmentation window is extended to be at least this long."
    );




public:
    MIN_DESCRIPTION{"Quickthresh with support for note offs"};
    MIN_TAGS{""};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"quickthresh, ser.score"};


    inlet<> inlet_main{this, "(nn, vel) Note on/off", ""};


    // infrequently accessed (only at end of each segmentation), thread checking won't impact performance
    outlet<thread_check::scheduler> outlet_main{
        this
        , Inlets::voice(Types::number, "Held notes in current segmented chord, output asynchronously")
    };


    // no thread check, output always on main thread
    outlet<> outlet_raw{this, Inlets::voice(Types::number, "Raw held notes, output on every note on/off")};


    // accessed by both threads, thread checking is necessary
    outlet<thread_check::main, thread_action::fifo> outlet_segmentation_info{ this, STATE_OUTLET_DESCRIPTION};


    outlet<> dumpout{this, Inlets::DUMPOUT};


    explicit ser_chordthresh(const atoms& = {}) {
        callback.delay(1.0);
    }


    timer<> callback{this, MIN_FUNCTION {

        // CRITICAL SECTION: BEGIN //

        std::unique_lock lock{m_mutex};

        if (auto segmented_chord = m_segmenter.poll()) {
            lock.unlock();

            // CRITICAL SECTION: END //

            output_state_info(MidiNoteSegmenter::State::segment_end);

            // we don't output a segment where all notes were released
            if (!segmented_chord->empty()) {
                outlet_main.send(AtomFormatter::vec2atoms<NoteNumber>(*segmented_chord));
            }
        }

        callback.delay(1.0);
        return {};
    }};


    /** @note: always accessed and updated on main thread */
    attribute<int> window{ this, "window" , static_cast<int>(MidiNoteSegmenter::DEFAULT_SEGMENTATION_WINDOW_MS),
        WINDOW_DESCRIPTION, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<double>(args); *v >= 0.0) {
                    m_segmenter.set_segmentation_window_ms(*v);
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                }

                return window;
            }
        }
    };


    /** @note: always accessed and updated on main thread */
    attribute<int> extension{ this, "extension", static_cast<int>(MidiNoteSegmenter::DEFAULT_EXTENSION_PERIOD_MS)
        , EXTENSION_DESCRIPTION, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<double>(args); *v >= 0.0) {
                    m_segmenter.set_extension_period_ms(*v);
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                }
                return extension;
            }
        }
    };


    /** @note: always accessed and updated on main thread */
    message<> flush{this, "flush", "Flush all held notes", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"flush\" for inlet " << inlet << endl;
            return {};
        }

        // CRITICAL SECTION: BEGIN //

        std::unique_lock lock{m_mutex};
        auto has_flushed = m_segmenter.flush();
        lock.unlock();

        // CRITICAL SECTION: END //

        if (has_flushed) {
            outlet_raw.send(AtomFormatter::vec2atoms_or_null<NoteNumber>({})); // Output empty vector on flush
        }

        return {};
    }}};


    function handle_input = MIN_FUNCTION {
        assert(c74::max::systhread_ismainthread());

        if (auto v = AtomParser::atoms2vec<NoteNumber>(args)) {
            if (v->size() == 3 || v->size() == 2) {
                // when passed with size 3 (nn, vel, ch): We ignore the channel but allow it to be passed

                // CRITICAL SECTION: BEGIN //

                std::unique_lock lock{m_mutex};

                if (auto chord_and_state= m_segmenter.process_input(v->operator[](0), v->operator[](1))) {
                    lock.unlock();

                    // CRITICAL SECTION: END//

                    auto& [raw_held, state] = *chord_and_state;

                    output_state_info(state);
                    outlet_raw.send(AtomFormatter::vec2atoms_or_null<NoteNumber>(raw_held));
                }

            } else {
                cerr << "bad input format" << endl;
            }
        } else {
            cerr << v.err().message() << endl;
        }

        return {};

    };

    message<> list{this, "list", "Raw stream of notes and velocities (and optionally channels)", handle_input};



private:
    /** @note: This is safe to call from any thread */
    void output_state_info(MidiNoteSegmenter::State state) {
        outlet_segmentation_info.send(AtomFormatter::value2atom<int>(state));
    }


    MidiNoteSegmenter m_segmenter;
    std::mutex m_mutex;
};


MIN_EXTERNAL(ser_chordthresh);