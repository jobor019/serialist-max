#include <core/algo/fraction.h>
#include <core/collections/vec.h>
#include <core/utility/mapping.h>


#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"

using namespace c74::min;
using namespace serialist;

struct MappingResult {
    double quantized_raw_value;
    std::variant<long, double, ExtendedFraction> scaled_value;
};


// ==============================================================================================

class ValueFormatter {
public:
    static const inline std::array<std::string, 12> note_names = {
            "C", "C#", "D", "Eb", "E", "F", "F#", "G", "G#", "A", "Bb", "B"
    };


    enum class Format {
        custom, percentage, midi_note, improper_fraction, mixed_fraction, fraction_list, enum_count
    };

    explicit ValueFormatter(Format fmt = Format::custom
                            , std::size_t num_decimals = 2
                            , bool is_integral = false
                            , bool scientific = false
                            , const std::string& prepend_arg = ""
                            , const std::string& append_arg = "")
            : m_fmt(fmt)
              , m_num_decimals(num_decimals)
              , m_is_integral(is_integral)
              , m_scientific(scientific)
              , m_prepend_arg(prepend_arg)
              , m_append_arg(append_arg) {}


    static std::string format_static(double x, double y, Format fmt, std::size_t num_decimals, bool scientific = false
                                     , const std::string& prepend_arg = ""
                                     , const std::string& append_arg = "") {
        switch (fmt) {
            case Format::percentage:
                return format_percentage(x, num_decimals);
            case Format::midi_note:
                return format_midi_note(y);
            default: // Any fractional format on a non-fractional value will fall back on `format_custom`
                return format_custom(y, num_decimals, scientific, prepend_arg, append_arg);
        }
    }


    static std::string format_fraction_static(const ExtendedFraction& q
                                              , Format fmt
                                              , const std::string& prepend_arg = ""
                                              , const std::string& append_arg = "") {
        switch (fmt) {
            case Format::mixed_fraction:
                return format_mixed_number(q);
            case Format::fraction_list:
                return format_fraction_list(q);
            default: // Any non-fractional format non a fraction value will fall back to improper
                return format_improper_fraction(q);
        }
    }


    std::string format(double x, double y) {
        return format_static(x, y, m_fmt, m_is_integral ? 0 : m_num_decimals, m_scientific
                             , m_prepend_arg, m_append_arg);
    }

    std::string format(const MappingResult& r) {
        if (std::holds_alternative<double>(r.scaled_value)) {
            return format(r.quantized_raw_value, std::get<double>(r.scaled_value));
        } else if (std::holds_alternative<long>(r.scaled_value)) {
            return format(r.quantized_raw_value, static_cast<double>(std::get<long>(r.scaled_value)));
        } else {
            return format_fraction_static(std::get<ExtendedFraction>(r.scaled_value)
                                          , m_fmt, m_prepend_arg, m_append_arg);
        }
    }


    void set_format(Format fmt) { m_fmt = fmt; }

    void set_num_decimals(std::size_t num_decimals) { m_num_decimals = num_decimals; }

    void set_integral(bool integral) { m_is_integral = integral; }

    void set_scientific(bool scientific) { m_scientific = scientific; }

    void set_prepend_arg(const std::string& s) { m_prepend_arg = s; }

    void set_append_arg(const std::string& s) { m_append_arg = s; }


private:
    static std::string format_percentage(double x, std::size_t num_decimals) {
        double y = x * 100.0;
        return format_number(y, num_decimals, false) + "%";
    }

    static std::string format_midi_note(double y) {
        auto pitch = std::lround(y);
        auto [octave, pitch_class] = utils::divmod(pitch, 12L);

        return note_names[pitch_class] + std::to_string(octave - 2);
    }

    static std::string format_custom(double y, std::size_t num_decimals, bool scientific
                                     , const std::string& prepend_arg, const std::string& append_arg) {
        std::string num = format_number(y, num_decimals, scientific);
        return prepend_arg + num + " " + append_arg;
    }

    static std::string format_improper_fraction(const ExtendedFraction& q) {
        return std::to_string(q.get_integral_part() * q.get_d() + q.get_n()) + "/" + std::to_string(q.get_d());
    }

    static std::string format_mixed_number(const ExtendedFraction& q) {
        std::stringstream ss;

        bool has_integral_part = std::abs(q.get_integral_part()) > 0;
        bool has_fractional_part = std::abs(q.get_n()) > 0;

        if (has_integral_part)
            ss << q.get_integral_part();

        if (has_integral_part && has_fractional_part)
            ss << " ";

        if (has_fractional_part)
            ss << q.get_n() << "/" << q.get_d();

        if (!has_integral_part && !has_fractional_part)
            ss << 0;

        return ss.str();
    }

    static std::string format_fraction_list(const ExtendedFraction& q) {
        return std::to_string(q.get_integral_part()) + " " + std::to_string(q.get_n()) + " " +
               std::to_string(q.get_d());
    }


    static std::string format_number(double num, std::size_t num_decimals, bool scientific = false) {
        std::stringstream ss;
        if (scientific) {
            ss << std::scientific;
        } else {
            ss << std::fixed;
        }

        ss << std::setprecision(static_cast<int>(num_decimals)) << num;
        return ss.str();
    }

    ValueFormatter::Format m_fmt;
    std::size_t m_num_decimals;
    bool m_is_integral;
    bool m_scientific;
    std::string m_prepend_arg;
    std::string m_append_arg;
};


// ==============================================================================================

class SliderMapping {
public:
    enum class MapMode {
        exponential, midpoint, enum_count
    };

    enum class Type {
        floating, integral, fractional, enum_count
    };


    explicit SliderMapping(MapMode mode = MapMode::exponential
                           , Type type = Type::floating
                           , double min = 0.0
                           , double max = 1.0
                           , std::optional<std::size_t> num_steps = std::nullopt
                           , bool quantize_feedback = true
                           , double exponent1 = 1.0
                           , std::optional<double> exponent2 = std::nullopt
                           , double midpoint = 0.5
                           , const std::variant<long, Vec<long>>& fractional_denominators = 32L)
            : m_map_mode(mode)
              , m_type(type)
              , m_minimum(min)
              , m_maximum(max)
              , m_num_steps(num_steps)
              , m_quantize_feedback(quantize_feedback)
              , m_exponent1(exponent1)
              , m_exponent2(exponent2)
              , m_midpoint(midpoint)
              , m_fractional_denominators(fractional_denominators) {
    }


    MappingResult process(double x) {
        x = utils::clip(x, 0.0, 1.0);

        double x_quantized = x;

        if (m_num_steps) {
            x_quantized = utils::quantize(x, *m_num_steps);
        }

        double min = std::min(m_minimum, m_maximum);
        double max = std::max(m_minimum, m_maximum);


        double y;

        switch (m_map_mode) {
            case MapMode::midpoint:
                y = utils::map_exponential(x_quantized, min, max, m_midpoint
                                           , m_exponent1, m_exponent2.value_or(m_exponent1));
                break;
            default:
                y = utils::map_exponential(x_quantized, min, max, m_exponent1);
                break;
        }

        double x_output = m_quantize_feedback ? x_quantized : x;

        switch (m_type) {
            case Type::integral:
                return handle_integral(x_output, y);
            case Type::fractional:
                return handle_fractional(x_output, y);
            default:
                return {x_output, y};
        }
    }


    Vec<MappingResult> process(const Vec<double>& xs) {
        return xs.cloned().as_type<MappingResult>([this](double x) { return process(x); });
    }

    MappingResult inverse(double y) {
        return {inversed(utils::clip(y, m_minimum, m_maximum)), y};
    }

    Vec<MappingResult> inverse(const Vec<double>& xs) {
        return xs.cloned().as_type<MappingResult>([this](double x) { return inverse(x); });
    }


    void set_map_mode(MapMode map_mode) { m_map_mode = map_mode; }

    void set_numeric_type(Type type) { m_type = type; }

    void set_minimum(double minimum) { m_minimum = minimum; }

    void set_maximum(double maximum) { m_maximum = maximum; }

    void set_num_steps(std::optional<std::size_t> num_steps) { m_num_steps = num_steps; }

    void set_quantize_feedback(bool quantize_feedback) { m_quantize_feedback = quantize_feedback; }

    void set_exponent1(double exponent1) { m_exponent1 = exponent1; }

    void set_exponent2(const std::optional<double>& exponent2) { m_exponent2 = exponent2; }

    void set_midpoint(double midpoint) { m_midpoint = midpoint; }

    void set_denominators(long d) {
        m_fractional_denominators = d;
    }

    void set_denominators(const Vec<long>& ds) { m_fractional_denominators = ds; }


private:
    MappingResult handle_fractional(double x, double y) {
        ExtendedFraction q;
        if (std::holds_alternative<long>(m_fractional_denominators)) {
            q = ExtendedFraction::from_decimal(y, std::get<long>(m_fractional_denominators));
        } else {
            q = ExtendedFraction::from_decimal(y, std::get<Vec<long>>(m_fractional_denominators));
        }

        if (m_quantize_feedback)
            return {inversed(q.get_decimal()), q};

        return {x, q};
    }

    static MappingResult handle_integral(double x, double y) {
        return {x, std::lround(y)};
    }

    double inversed(double y) {
        double min = std::min(m_minimum, m_maximum);
        double max = std::max(m_minimum, m_maximum);

        if (m_map_mode == MapMode::midpoint) {
            return utils::map_inverse_exponential(y, min, max, m_midpoint, m_exponent1
                                                  , m_exponent2.value_or(m_exponent1));
        }
        return utils::map_inverse_exponential(y, min, max, m_exponent1);
    }


    MapMode m_map_mode;
    Type m_type;
    double m_minimum;
    double m_maximum;
    std::optional<std::size_t> m_num_steps;
    bool m_quantize_feedback;

    double m_exponent1;
    std::optional<double> m_exponent2;
    double m_midpoint;
    std::variant<long, Vec<long>> m_fractional_denominators;
};


class slidermapping : public c74::min::object<slidermapping> {
private:
    struct Input {
        c74::min::atoms args;
        bool input_is_x = true;
    };

    SliderMapping m_mapping;
    ValueFormatter m_formatter;
    Input m_last_input;

public:
    MIN_DESCRIPTION{"Variable-state mapping"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"scale, live.numbox"};

    inlet<> inlet_main{this, "(float/list, 0 - 1) raw value(s) to scale"};
    inlet<> inlet_min{this, "(float/int) minimum"};
    inlet<> inlet_max{this, "(float/int) maximum"};

    outlet<> outlet_main{this, "(float/int/list) scaled value(s)"};
    outlet<> outlet_symout{this, "(symbol/list) formatted string"};
    outlet<> outlet_feedback{this, "(float/list) feedback / quantized raw value(s)"};


    attribute<bool> enabled{this, "enabled", true};

    attribute<std::vector<double>> initial{this, "initial", {0.0}, setter{
            MIN_FUNCTION {
                process({args, false});
                return args;
            }
    }};


    attribute<double> minimum{this, "minimum", 0.0, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<double>(args)) {
                    m_mapping.set_minimum(*v);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return minimum;
                }
            }
    }};

    attribute<double> maximum{this, "maximum", 1.0, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<double>(args)) {
                    m_mapping.set_maximum(*v);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return maximum;
                }
            }
    }
    };

    c74::min::enum_map mode_info = {"exponential", "midpoint"};

    attribute<SliderMapping::MapMode> mode{this, "mode", SliderMapping::MapMode::exponential, mode_info, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<SliderMapping::MapMode>(args)) {
                    if (v.ok() >= SliderMapping::MapMode::enum_count) {
                        cwarn << "invalid mode, using default" << endl;
                    }

                    m_mapping.set_map_mode(*v);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return mode;
                }
            }
    }
    };

    c74::min::enum_map type_info = {"floating", "integral", "fractional"};

    attribute<SliderMapping::Type> type{this, "type", SliderMapping::Type::floating, type_info, title{"Type"}
                                        , description{"output type on left outlet"}, setter{
                    MIN_FUNCTION {
                        if (auto v = AtomParser::atoms2value<SliderMapping::Type>(args)) {
                            if (v.ok() >= SliderMapping::Type::enum_count) {
                                cwarn << "invalid type, using default" << endl;
                            }

                            m_mapping.set_numeric_type(*v);
                            process();
                            return args;
                        } else {
                            cerr << v.err().message() << endl;
                            return mode;
                        }
                    }
            }
    };

    attribute<int> numsteps{this, "numsteps", -1, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<long>(args)) {
                    m_mapping.set_num_steps(v.ok() > 0
                                            ? std::make_optional<long>(static_cast<std::size_t>(*v))
                                            : std::nullopt);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return numsteps;
                }
            }
    }
    };

    attribute<std::vector<double>> exponent{this, "exponent", {1.0}, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2vec<double>(args)) {
                    if (v->empty()) {
                        cerr << "exponent must have at least one value" << endl;
                        return exponent;
                    }

                    if (v->size() > 2) {
                        cwarn << ErrorMessages::extra_argument("exponent") << endl;
                    }

                    if (v->size() == 2) {
                        if (v.ok()[1] < 0.0) {
                            cwarn << "negative exponent not allowed, exponent clipped to 0" << endl;
                        }
                        m_mapping.set_exponent2(std::max(0.0, v.ok()[1]));
                    }

                    if (v.ok()[0] < 0.0) {
                        cwarn << "negative exponent not allowed, exponent clipped to 0" << endl;
                    }

                    m_mapping.set_exponent1(std::max(0.0, v.ok()[0]));
                    process();
                    return args;

                } else {
                    cerr << v.err().message() << endl;
                    return exponent;
                }
            }
    }};

    attribute<double> midpoint{this, "midpoint", 0.5, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<double>(args)) {
                    m_mapping.set_midpoint(*v);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return midpoint;
                }
            }
    }
    };


    // Note: objects that respond to absolute mouse position (e.g. multislider) behaves extremely well when the
    // feedback is quantized, but mouse delta-based objects (e.g. live.numbox) will run into lots of issues when the
    // output is quantized (dragging past certain thresholds becomes extremely difficult).
    attribute<bool> quantizefeedback{this, "quantizefeedback", true, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<bool>(args)) {
                    m_mapping.set_quantize_feedback(*v);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return quantizefeedback;
                }
            }
    }
    };

    c74::min::enum_map format_info = {"number", "percentage", "midinote", "improperfrac", "mixed", "fraclist"};

    attribute<ValueFormatter::Format> format{this, "format", ValueFormatter::Format::custom, format_info, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<ValueFormatter::Format>(args)) {
                    if (v.ok() >= ValueFormatter::Format::enum_count) {
                        cwarn << "invalid format, using default" << endl;
                    }

                    m_formatter.set_format(*v);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return format;
                }
            }
    }
    };


    attribute<int> decimals{this, "decimals", 2, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<int>(args)) {
                    m_formatter.set_num_decimals(*v > 0 ? static_cast<std::size_t>(*v) : 0u);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return decimals;
                }
            }
    }};


    attribute<bool> scientific{this, "scientific", false, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<bool>(args)) {
                    m_formatter.set_scientific(*v);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return decimals;
                }
            }
    }};


    attribute<symbol> prependarg{this, "prependarg", "", setter{
            MIN_FUNCTION {
                if (args.empty()) {
                    m_formatter.set_append_arg("");
                    process();
                    return args;
                }

                if (auto v = AtomParser::atoms2value<std::string>(args)) {
                    m_formatter.set_prepend_arg(*v);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return prependarg;
                }
            }
    }};


    attribute<symbol> appendarg{this, "appendarg", "", setter{
            MIN_FUNCTION {
                if (args.empty()) {
                    m_formatter.set_append_arg("");
                    process();
                    return args;
                }

                if (auto v = AtomParser::atoms2value<std::string>(args)) {
                    m_formatter.set_append_arg(*v);
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return appendarg;
                }
            }
    }};

    attribute<std::vector<int>> denominators{this, "denominators", {-32}, setter{
            MIN_FUNCTION {
                if (args.empty()) {
                    cerr << "no denominator provided" << endl;
                    return denominators;
                }

                if (args.size() == 1) {
                    if (auto v = AtomParser::atoms2value<long>(args)) {
                        if (*v == 0) {
                            cerr << "zero denominator not allowed" << endl;
                            return denominators;
                        } else if (*v < 0) {
                            // single negative denominator => use abs value as max_denominator (i.e. range from 1 to v)
                            m_mapping.set_denominators(std::abs(*v));
                        } else {
                            // single positive denominator => use as single chosen denominator (vector of size 1)
                            m_mapping.set_denominators(Vec<long>::singular(*v));
                        }

                        process();
                        return args;

                    } else {
                        cerr << v.err().message() << endl;
                        return denominators;
                    }
                }

                if (auto v = AtomParser::atoms2vec<long>(args)) {
                    if (v->any([](long v) { return v < 1L; })) {
                        cwarn << "invalid denominator clipped to 1" << endl;
                    }

                    m_mapping.set_denominators(v->map([](long v) { return std::max(v, 1L); }));
                    process();
                    return args;
                } else {
                    cerr << v.err().message() << endl;
                    return denominators;
                }
            }
    }
    };


    message<> range{this, "range", "set minimum and maximum", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"range\" for inlet " << inlet << endl;
            return {};
        }

        if (args.size() != 2) {
            cerr << "range requires exactly two arguments" << endl;
            return {};
        }

        minimum.set({args[0]});
        maximum.set({args[1]});

        return {};
    }}};


    message<> setraw{this, "setraw", "set raw value (x) without output on first outlet", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"setraw\" for inlet " << inlet << endl;
            return {};
        }

        process({args, true}, false);

        return {};
    }}};


    message<> output{this, "output", "set scaled value (y)", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"output\" for inlet " << inlet << endl;
            return {};
        }

        process({args, false});

        return {};
    }}};


    message<> setoutput{this, "setoutput", "set scaled value (y) without output on first outlet", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"setoutput\" for inlet " << inlet << endl;
            return {};
        }

        process({args, false}, false);

        return {};
    }}};


    c74::min::function handle_input = MIN_FUNCTION {
        if (inlet == 2) {
            maximum.set(args);
        } else if (inlet == 1) {
            minimum.set(args);
        } else {
            process({args, true});
        }

        return {};
    };


    message<> bang{this, "bang", MIN_FUNCTION {
        process();
        return {};
    }};


    message<> list{this, "list", handle_input};
    message<> number{this, "number", handle_input};


private:
    void process(const Input& input, bool trigger_output = true) {
        m_last_input = input;
        process(trigger_output);
    }

    void process(bool trigger_output = true) {
        auto& args = m_last_input.args;
        if (args.empty()) {
            return;
        }

        if (args.size() == 1) {
            if (auto v = AtomParser::atoms2value<double>(args)) {
                process_single(*v, m_last_input.input_is_x, trigger_output);
                return;
            } else {
                cerr << v.err().message() << endl;
                return;
            }
        }

        if (auto v = AtomParser::atoms2vec<double>(args)) {
            process_multiple(*v, m_last_input.input_is_x, trigger_output);
        } else {
            cerr << v.err().message() << endl;
            return;
        }
    }

    static atom rvariant2atom(const std::variant<long, double, ExtendedFraction>& v) {
        if (std::holds_alternative<double>(v)) {
            return AtomFormatter::value2atom<double>(std::get<double>(v));
        } else if (std::holds_alternative<long>(v)) {
            return AtomFormatter::value2atom<long>(std::get<long>(v));;
        } else {
            return AtomFormatter::value2atom<double>(std::get<ExtendedFraction>(v).get_decimal());
        }
    }

    void process_single(double raw_value, bool is_x, bool trigger_output) {
        auto mapping_result = is_x ? m_mapping.process(raw_value) : m_mapping.inverse(raw_value);

        atoms output_feedback{AtomFormatter::value2atom<double>(mapping_result.quantized_raw_value)};
        outlet_feedback.send(output_feedback);

        atoms output_fmt{AtomFormatter::value2atom<std::string>(m_formatter.format(mapping_result))};
        outlet_symout.send(output_fmt);

        if (trigger_output && enabled.get()) {
            atoms output_main{rvariant2atom(mapping_result.scaled_value)};
            outlet_main.send(output_main);
        }

    }

    void process_multiple(const Vec<double>& xs, bool is_x, bool trigger_output) {
        auto mapping_result = is_x ? m_mapping.process(xs) : m_mapping.inverse(xs);

        atoms output_feedback;
        atoms output_fmt;
        atoms output_main;

        for (const auto& r: mapping_result) {
            output_main.emplace_back(rvariant2atom(r.scaled_value));
            output_fmt.emplace_back(AtomFormatter::value2atom<std::string>(m_formatter.format(r)));
            output_feedback.emplace_back(AtomFormatter::value2atom<double>(r.quantized_raw_value));
        }

        outlet_feedback.send(output_feedback);
        outlet_symout.send(output_fmt);

        if (trigger_output && enabled.get()) {
            outlet_main.send(output_main);
        }
    }

};


MIN_EXTERNAL(slidermapping);
