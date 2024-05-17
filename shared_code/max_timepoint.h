
#ifndef SERIALIST_MAX_MAX_TIMEPOINT_H
#define SERIALIST_MAX_MAX_TIMEPOINT_H

#include "c74_min_api.h"
#include "parsing.h"
#include "core/algo/time/transport.h"
#include "max_stereotypes.h"

class MaxTimePoint {
public:

    MaxTimePoint(double tempo, double ticks, long bars, long beats, double units, long meter_num, long meter_denom)
            : m_tempo(tempo)
              , m_ticks(ticks)
              , m_bars(bars)
              , m_beats(beats)
              , m_units(units)
              , m_meter_num(meter_num)
              , m_meter_denom(meter_denom) {}


    static std::optional<MaxTimePoint> get_time_of(const c74::min::atoms& clock_name) {
        if (clock_name.empty()) {
            return get_time_of(c74::min::atom());
        }
        return std::nullopt;
    }


    static std::optional<MaxTimePoint> get_time_of(const c74::min::atom& clock_name) {
        c74::max::t_itm* clock_source;
        if (parsing::is_empty_like(clock_name)) {
            clock_source = (c74::max::t_itm*) c74::max::itm_getglobal();
        } else {
            clock_source = (c74::max::t_itm*) c74::max::itm_getnamed(clock_name, nullptr, nullptr, 0l);
        }

        if (clock_source) {
            auto tempo = itm_gettempo(clock_source);
            auto ticks = itm_getticks(clock_source);
            auto [bars, beats, units] = get_bar_beat_units(*clock_source, ticks);
            auto [numerator, denominator] = get_time_signature(*clock_source);

            return MaxTimePoint(tempo, ticks, bars, beats, units, numerator, denominator);
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
        auto meter = Meter(static_cast<int>(m_meter_num), static_cast<int>(m_meter_denom));
        auto units = m_units / 480.0;
        auto beats = static_cast<double>(m_beats - 1) + meter.ticks2beats(units);
        auto bars = static_cast<double>(m_bars) + meter.beats2bars(beats);

        return TimePoint(m_ticks / 480.0, m_tempo, std::nullopt, beats, bars, meter);
    }


    std::string to_string() const {
        return "tempo: " + std::to_string(m_tempo) +
               " ticks: " + std::to_string(m_ticks) +
               " bars: " + std::to_string(m_bars) +
               " beats: " + std::to_string(m_beats) +
               " units: " + std::to_string(m_units) +
               " meter: " + std::to_string(m_meter_num) + "/" + std::to_string(m_meter_denom);
    }


    double get_tempo() const { return m_tempo; }

    double get_ticks() const { return m_ticks; }

    long get_bars() const { return m_bars; }

    long get_beats() const { return m_beats; }

    double get_units() const { return m_units; }

    long get_meter_num() const { return m_meter_num; }

    long get_meter_denom() const { return m_meter_denom; }


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
    long m_meter_num;
    long m_meter_denom;


};

#endif //SERIALIST_MAX_MAX_TIMEPOINT_H
