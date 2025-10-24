
#ifndef SERIALIST_MAX_MAX_TIMEPOINT_H
#define SERIALIST_MAX_MAX_TIMEPOINT_H

#include "c74_min_api.h"
#include "parsing.h"
#include "core/temporal/transport.h"
#include "max_stereotypes.h"

class MaxTimePoint {
public:

    MaxTimePoint(double tempo
                 , double ticks
                 , long bars
                 , long beats
                 , double units
                 , double ppq
                 , long meter_num
                 , long meter_denom
                 , bool transport_running)
            : m_tempo(tempo)
              , m_ticks(ticks)
              , m_bars(bars)
              , m_beats(beats)
              , m_units(units)
              , m_ppq(ppq)
              , m_meter_num(meter_num)
              , m_meter_denom(meter_denom)
              , m_transport_running(transport_running) {}


    static Result<MaxTimePoint> parse(const c74::min::atoms& args) {
        // Expected format is the exact format of the 8 first outlets of the default [transport] object:
        // 0: bars           (long)
        // 1: beats          (long)
        // 2: units          (double)
        // 3: ppq            (double)
        // 4: tempo          (double)
        // 5: meter num      (long)
        // 6: meter denom    (long)
        // 7: running        (bool)
        // 8: raw ticks      (double)

        if (args.size() != 9) {
            return Error{"expected 9 args, got " + std::to_string(args.size())};
        }

        long bars = 0;
        long beats = 0;
        double units = 0.0;
        double ppq = 0.0;
        double tempo = 0.0;
        long meter_num = 0;
        long meter_denom = 0;
        bool running = false;
        double raw_ticks = 0.0;

        auto get = [&](auto& dst, size_t idx) -> Result<void> {
            using T = std::decay_t<decltype(dst)>;

            if (auto v = AtomParser::atom2value<T>(args[idx])) {
                dst = *v;
                return {};
            } else {
                return Error{v.err().message()};
            }
        };

        if (auto r = get(bars, 0); !r) return Error{r.err().message()};
        if (auto r = get(beats, 1); !r) return Error{r.err().message()};
        if (auto r = get(units, 2); !r) return Error{r.err().message()};
        if (auto r = get(ppq, 3); !r) return Error{r.err().message()};
        if (auto r = get(tempo, 4); !r) return Error{r.err().message()};
        if (auto r = get(meter_num, 5); !r) return Error{r.err().message()};
        if (auto r = get(meter_denom, 6); !r) return Error{r.err().message()};
        if (auto r = get(running, 7); !r) return Error{r.err().message()};
        if (auto r = get(raw_ticks, 8); !r) return Error{r.err().message()};

        if (ppq == 0.0) {
            return Error{"PPQ cannot be 0"};
        }
        if (meter_denom == 0) {
            return Error{"meter denominator cannot be 0"};
        }

        return MaxTimePoint(
            tempo
            , raw_ticks
            , bars
            , beats
            , units
            , ppq
            , meter_num
            , meter_denom
            , running
        );
    }


    static std::optional<MaxTimePoint> get_time_of(const c74::min::atoms& clock_name) {
        if (clock_name.empty()) {
            return get_time_of(c74::min::atom());
        }
        return std::nullopt;
    }


    static std::optional<MaxTimePoint> get_time_of(const c74::min::atom& clock_name) {
        c74::max::t_itm* clock_source;
        if (parsing::is_empty_like(clock_name)) {
            clock_source = static_cast<c74::max::t_itm*>(c74::max::itm_getglobal());
        } else {
            clock_source = static_cast<c74::max::t_itm*>(c74::max::itm_getnamed(clock_name, nullptr, nullptr, 0L));
        }

        if (clock_source) {
            auto tempo = itm_gettempo(clock_source);
            auto ticks = itm_getticks(clock_source);
            auto [bars, beats, units] = get_bar_beat_units(*clock_source, ticks);
            auto [numerator, denominator] = get_time_signature(*clock_source);
            auto ppq = c74::max::itm_getresolution();
            auto state = itm_getstate(clock_source);

            return MaxTimePoint(tempo, ticks, bars, beats, units, ppq, numerator, denominator, state);
        }

        return std::nullopt;
    }


    static Result<TimePoint> get_time_point_of(const c74::min::atom& clock_name) {
        if (auto tp = get_time_of(clock_name)) {
            return tp->as_time_point();
        } else {
            return Error(ErrorMessages::CLOCK_SOURCE_UNKNOWN);
        }
    }

    TimePoint as_time_point() const {
        assert(m_ppq > 0.0);
        auto meter = Meter(static_cast<int>(m_meter_num), static_cast<int>(m_meter_denom));
        auto units = m_units / m_ppq;
        // Note that this is not an appropriate representation of absolute beat if the time signature has changed over the course of time
        auto beats = static_cast<double>(m_beats - 1) + meter.ticks2beats(units);
        auto bars = static_cast<double>(m_bars) + meter.beats2bars(beats);

        return TimePoint(m_ticks / m_ppq, m_tempo, std::nullopt, beats, bars, meter, m_transport_running);
    }


    std::string to_string() const {
        return "tempo: " + std::to_string(m_tempo) +
               " ticks: " + std::to_string(m_ticks) +
               " bars: " + std::to_string(m_bars) +
               " beats: " + std::to_string(m_beats) +
               " units: " + std::to_string(m_units) +
               " ppq: " + std::to_string(m_ppq) +
               " meter: " + std::to_string(m_meter_num) + "/" + std::to_string(m_meter_denom)
               + " running: " + std::to_string(m_transport_running);
    }

    c74::min::atoms to_atoms() const {
        return c74::min::atoms{m_tempo, m_ticks, m_bars, m_beats, m_units, m_meter_num, m_meter_denom, m_transport_running};
    }


    double get_tempo() const { return m_tempo; }

    double get_ticks() const { return m_ticks; }

    long get_bars() const { return m_bars; }

    long get_beats() const { return m_beats; }

    double get_units() const { return m_units; }

    long get_meter_num() const { return m_meter_num; }

    long get_meter_denom() const { return m_meter_denom; }

    bool get_transport_running() const { return m_transport_running; }


private:

    static std::tuple<long, long, double> get_bar_beat_units(c74::max::t_itm& clock, double ticks) {
        long bars;
        long beats;
        double units;
        itm_tickstobarbeatunits(&clock, ticks, &bars, &beats, &units, (char) c74::max::TIME_FLAGS_LOCATION);
        return {bars, beats, units};
    }


    static std::pair<long, long> get_time_signature(c74::max::t_itm& clock) {
        long numerator;
        long denominator;
        itm_gettimesignature(&clock, &numerator, &denominator);
        return {numerator, denominator};
    }


    double m_tempo;
    double m_ticks;
    long m_bars;
    long m_beats;
    double m_units;
    double m_ppq;
    long m_meter_num;
    long m_meter_denom;
    bool m_transport_running;


};

#endif //SERIALIST_MAX_MAX_TIMEPOINT_H
