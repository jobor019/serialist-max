
#ifndef SERIALIST_MAX_MAX_TIMEPOINT_H
#define SERIALIST_MAX_MAX_TIMEPOINT_H

#include "c74_min_api.h"
#include "parsing.h"

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


    explicit operator TimePoint() const {
        return TimePoint(m_ticks, m_tempo
                         , static_cast<double>(m_beats)
                         , Meter(static_cast<int>(m_meter_num), static_cast<int>(m_meter_denom)));
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
