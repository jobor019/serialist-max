#include <core/policies/policies.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "message_stereotypes.h"
#include "inlet_triggers.h"

using namespace c74::min;
using namespace serialist;

enum class ZipMode {
    min_size = 0, broadcast = 1
};

struct Parameters {
    static constexpr double DEFAULT_NULL_REPLACEMENT{0.0};
    static constexpr double DEFAULT_TOLERANCE{1e-3};
    static constexpr auto DEFAULT_ZIP_MODE{ZipMode::min_size};

    double null_replacement{DEFAULT_NULL_REPLACEMENT};
    double tolerance{DEFAULT_TOLERANCE};
    ZipMode zip_mode{DEFAULT_ZIP_MODE};
};

// ==============================================================================================


class UtilityOperator {
public:
    virtual ~UtilityOperator() = default;

    /** @brief utility operator for objects that should respond to "bang" */
    virtual Result<atoms> operator()() { return atoms{}; };

    virtual Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t inlet, bool is_hot) = 0;

    virtual std::size_t num_inlets() const { return 1; }

};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Computes the length of the parsed Voices object
 */
class LenOperator : public UtilityOperator {
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t, bool) override {
        std::size_t len = 0;

        if (auto v = AtomParser::atoms2voices<int>(args)) {
            len = v->size();
        }

        if (auto v = AtomParser::atoms2voices<double>(args)) {
            len = v->size();
        }

        if (auto v = AtomParser::atoms2voices<std::string>(args)) {
            len = v->size();
        }

        return {{len}};
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Maps any null in a Voices to a default value
 */
class NullMapOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t, bool) override {
        // TODO: This doesn't handle symbols properly: @dependency:SER-350
        if (auto v = AtomParser::atoms2voices<double>(args)) {
            auto voices = v.ok();
            for (auto& voice: voices) {
                if (voice.empty()) {
                    voice.append(params.null_replacement);
                }
            }
            return AtomFormatter::voices2atoms<double>(voices);
        }

        // If input doesn't match voices format, we just let it pass through rather
        // than print errors (no need to nullmap anything)
        return args;
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Replaces any inner list with a given value with "null"
 */
class NullifyOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t inlet, bool is_hot) override {
        if (auto v = AtomParser::atoms2voices<double>(args)) {
            for (auto& voice: v->vec_mut()) {
                if (voice.size() == 1 && utils::equals(voice[0], params.null_replacement, params.tolerance)) {
                    voice.clear();
                }
            }
            return AtomFormatter::voices2atoms<double>(*v);
        } else {
            return v.err();
        }
    }
};

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Takes a flat list input and converts it into a Voices of size 1 x M (chord), e.g. `1 2 3 => [ [ 1 2 3 ] ]`
 *        Note that this mode does not support mixes of null and non-null elements (e.g. `1 null 3`).
 */
class ChordOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t, bool) override {
        if (auto v = AtomParser::atoms2vec<double>(args)) {
            auto chord = v->empty() ? Voices<double>::empty_like() : Voices<double>::singular(*v);

            return AtomFormatter::voices2atoms<double>(chord);
        } else {
          return v.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Takes a Voices and returns the first voice as a flat list, e.g.
 *         [ [ 1 ] [ 2 ] [ 3 ] ] => 1,
 *         [ [ 1 2 3 ] ]         => 1 2 3
 *         [ [ ] [ 1 2 3 ] ]     => null
 */
class FirstOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t, bool) override {
        if (auto v = AtomParser::atoms2voices<double>(args)) {
            if (auto first = v->first_vec<>(); first && !first->empty()) {
                return AtomFormatter::vec2atoms<double>(*first);
            }
            return atoms{"null"};

        } else {
            return v.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Takes a flat list input and converts it into a Voices of size N x 1 (sequence), e.g.
 *        - 1 2 3                      => [ [ 1 ] [ 2 ] [ 3 ] ]
 *        - 1 null 3                   => [ [ 1 ] [   ] [ 3 ] ]
 *        - [ [ 1 2 3 ] [ 4 5 ] [ 6 ]  => [ [ 1 ] [ 4 ] [ 6 ] ]
 *        Note that if the input is a Voices object of size N x M, it will return the first value in each voice
 */
class SequenceOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t, bool) override {
        if (auto v = AtomParser::atoms2voices<double>(args)) {
            auto firsts = v->firsts<>();

            auto sequence = Vec<Vec<double>>::repeated(firsts.size(), Vec<double>{});
            for (std::size_t i = 0; i < firsts.size(); ++i) {
                if (firsts[i]) {
                    sequence[i] = {*firsts[i]};
                }
            }

            return AtomFormatter::voices2atoms<double>(Voices<double>{sequence});
        } else {
            return v.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Voices operator, returns the input parsed as a Voices object in explicit format
 *        (basically a unit operator format-parse round-trip), e.g.
 *        - null     => [ [ ] ]
 *        - 1        => [ [ 1 ] ]
 *        - 1 null 3 => [ [ 1 ] [ ] [ 3 ] ]
 */
class VoicesOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t, bool) override {
        if (auto v = AtomParser::atoms2voices<double>(args)) {

            // One of those edge cases where we can't infer type from std::nullopt
            std::optional<std::function<double(double)>> explicit_nullopt{std::nullopt};
            return AtomFormatter::voices2atoms<double>(*v, explicit_nullopt, true);

        } else {
            return v.err();
        }
    }
};

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Takes a Voices input and returns 1 for each voice containing a non-null value greater than 0, otherwise 0, e.g.
 *        - [ [ 0 0 1 ] [ 0 0 0 ] ]    => [ [ 1 ] [ 0 ] ]
 *        - 1 null 0                   => [ [ 1 ] [ 0  ] [ 0 ] ]
 *        Note that we can use this with `ser.op` to test more elaborate conditions, e.g.
 *        `ser.op % 12 -> ser.op == 4 -> ser.util any` returns 1 for every Voice in a Voices containing an E.
 */
class AnyOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t inlet, bool is_hot) override {
        if (auto voices = AtomParser::atoms2voices<double>(args)) {

            auto bool_mask = voices->vec().as_type<bool>([](const Voice<double>& v) {
                return v.any([](const double& x) { return x > 0; });
            });

            return AtomFormatter::vec2atoms<bool>(bool_mask);

        } else {
            return voices.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Takes a Voices input and returns 1 for each voice containing only values greater than 0, otherwise 0, e.g.
 *        - [ [ 0 0 1 ] [ 0 0 0 ] ]    => [ [ 0 ] [ 0 ] ]
 *        - [ [ 1 1 1 ] [ 0 0 0 ] ]    => [ [ 1 ] [ 0 ] ]
 *        - 1 null 0                   => [ [ 1 ] [ 1  ] [ 0 ] ]
 *        Note that this returns true for empty voices
 */
class AllOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t inlet, bool is_hot) override {
        if (auto voices = AtomParser::atoms2voices<double>(args)) {

            auto bool_mask = voices->vec().as_type<bool>([](const Voice<double>& v) {
                return v.all([](const double& x) { return x > 0; });
            });

            return AtomFormatter::vec2atoms<bool>(bool_mask);

        } else {
            return voices.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Takes a Voices input and returns the number of values greater than 0 in each voice, e.g.
 *        - [ [ 0 1 1 ] [ 0 0 0 ] ]    => [ [ 2 ] [ 0 ] ]
 *        - 1 null 0                   => [ [ 1 ] [ 0 ] [ 0 ] ]
 */
class CountOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t inlet, bool is_hot) override {
        if (auto voices = AtomParser::atoms2voices<double>(args)) {

            auto counts = voices->vec().as_type<std::size_t>([](const Voice<double>& v) {
                return v.count([](const double& x) { return x > 0; });
            });

            return AtomFormatter::vec2atoms<std::size_t>(counts);

        } else {
            return voices.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Sorts each voice individually. e.g.
 *          - [ [ 1 3 2 ] [ 2 1 ] => [ [ 1 2 3 ] [ 1 2 ] ]
 */
class SortOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t inlet, bool is_hot) override {
        if (auto voices = AtomParser::atoms2voices<double>(args)) {

            for (auto& v : voices->vec_mut()) {
                v.sort();
            }

            return AtomFormatter::voices2atoms<double>(*voices);

        } else {
            return voices.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Removes duplicates from each voice individually. uses Parameters::tolerance to determine equality. e.g.
 *          - [ [ 1 2 2 3 ] [ 1 2 ] [ 5 5 5 ] ] => [ [ 1 2 3 ] [ 1 2 ] [ 5 ] ]
 *          - [ [ 0.1 0.11 0.2 ] ] (tolerance = 0.1) => [ [ 0.1 0.2 ] ]
 */
class UniqueOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t inlet, bool is_hot) override {
        if (auto voices = AtomParser::atoms2voices<double>(args)) {

            for (auto& v : voices->vec_mut()) {
                v.unique(params.tolerance);
            }

            return AtomFormatter::voices2atoms<double>(*voices);

        } else {
            return voices.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Returns pitches as unique, sorted pitch classes, e.g.
 *          - [ [ 59 60 61 ] [ 48 60 ] ] => [ [ 0 1 11 ] [ 0 ] ]
 */
class PitchClassesOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t inlet, bool is_hot) override {
        if (auto voices = AtomParser::atoms2voices<int>(args)) {
            for (auto& v : voices->vec_mut()) {
                v.map([](int x) { return x % 12; }).unique(); // note: unique already sorts
            }

            return AtomFormatter::voices2atoms<int>(*voices);

        } else {
            return voices.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/** @brief Given J inlets with a Voices of size N x 1 (sequence), returns the zipped (stacked) Voices of size N x J */
class ZipOperator : public UtilityOperator {
public:
    explicit ZipOperator(std::size_t num_inlets) : m_values(Vec<Voice<double>>::repeated(num_inlets, Voice<double>{})) {
        assert(num_inlets > 0);
    }


    /**
     * @throws std::invalid_argument if no valid size is provided
     */
    static std::unique_ptr<ZipOperator> parse(const atoms& args) {
        assert(!args.empty() && args[0] == "zip");

        if (args.size() < 2) {
            throw std::invalid_argument(R"(missing argument "size" for mode "zip")");
        }

        if (auto size = AtomParser::atom2value<std::size_t>(args[1])) {
            return std::make_unique<ZipOperator>(std::max(static_cast<std::size_t>(1), *size));
        } else {
            throw std::invalid_argument(size.err().message());
        }
    }


    Result<atoms> operator()() override {
        return zip();
    }


    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t inlet, bool is_hot) override {
        assert(inlet < size());

        if (auto v = AtomParser::atoms2voices<double>(args)) {
            if (v->is_empty_like()) {
                m_values[inlet].clear();
            } else {
                m_values[inlet] = v->firsts_or(params.null_replacement);
            }

            if (is_hot) {
                return zip(params.zip_mode);
            }
            return atoms{};

        } else {
            return v.err();
        }

    }

    std::size_t num_inlets() const override { return size(); }

private:
    atoms zip(ZipMode mode = Parameters::DEFAULT_ZIP_MODE) const {
        Vec<Voice<double>> v;
        if (mode == ZipMode::broadcast) {
            v = zip_broadcasted();
        } else if (mode == ZipMode::min_size) {
            v = zip_minimum_vector_size();
        } else {
            throw std::invalid_argument("unknown zip mode");
        }

        if (v.empty()) {
            return AtomFormatter::voices2atoms<double>(Voices<double>::empty_like());
        }

        return AtomFormatter::voices2atoms<double>(Voices<double>{v});
    }


    Vec<Voice<double>> zip_broadcasted() const {
        auto size_per_voice = m_values.as_type<std::size_t>([](const Voice<double>& v) { return v.size(); });

        if (size_per_voice.any([](std::size_t x) { return x == 0; })) {
            // Cannot broadcast empty voices
            return {};
        }

        auto num_voices = size_per_voice.max<>();

        auto broadcasted_values = m_values.cloned().map([num_voices](Voice<double> v) {
            return v.resize_fold(num_voices);
        });

        return zip_common(num_voices, broadcasted_values);
    }


    Vec<Voice<double>> zip_minimum_vector_size() const {
        auto num_voices = m_values
                .as_type<std::size_t>([](const Voice<double>& v) { return v.size(); })
                .min<>();

        if (num_voices == 0) {
            return {};
        }

        return zip_common(num_voices, m_values);
    }


    Vec<Voice<double>> zip_common(std::size_t num_voices, const Vec<Voice<double>>& values) const {
        auto num_inlets = size();

        auto zipped = Vec<Voice<double>>::allocated(num_voices);

        for (std::size_t voice_index = 0; voice_index < num_voices; ++voice_index) {
            auto v = Voice<double>::allocated(num_inlets);

            for (int inlet_index = 0; inlet_index < num_inlets; ++inlet_index) {
                v.append(values[inlet_index][voice_index]);
            }
            zipped.append(std::move(v));
        }

        return zipped;

    }


    std::size_t size() const { return m_values.size(); }

    Vec<Voice<double>> m_values;
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


/**
 * @brief Output atoms as ints
 */
class IntOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params, std::size_t, bool) override {
        if (auto v = AtomParser::atoms2voices<double>(args)) {
            return AtomFormatter::voices2atoms<int>(*v);
        } else {
            return v.err();
        }
    }
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * @brief Output a list of sizes of each voice
 */
class SizeOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters&, std::size_t, bool) override {
        if (auto v = AtomParser::atoms2voices<double>(args)) {
            auto sizes = Vec<atom>::allocated(v->size());
            for (const auto& voice : *v) {
                sizes.append(voice.size());
            }

            // Note: since a Voices<T> never is empty, sizes will at least contain a single value
            // (e.g. Voices<T>::empty_like.size() == 1)
            return atoms{sizes.vector()};

        } else {
            return v.err();
        }
}};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

inline std::unique_ptr<UtilityOperator> string2operator(const std::string& s, const atoms& args) {
    if (s == "len")
        return std::make_unique<LenOperator>();
    if (s == "nullmap")
        return std::make_unique<NullMapOperator>();
    if (s == "nullify")
        return std::make_unique<NullifyOperator>();
    if (s == "chord")
        return std::make_unique<ChordOperator>();
    if (s == "first")
        return std::make_unique<FirstOperator>();
    if (s == "sequence")
        return std::make_unique<SequenceOperator>();
    if (s == "voices")
        return std::make_unique<VoicesOperator>();
    if (s == "any")
        return std::make_unique<AnyOperator>();
    if (s == "all")
        return std::make_unique<AllOperator>();
    if (s == "count")
        return std::make_unique<CountOperator>();
    if (s == "sort")
        return std::make_unique<SortOperator>();
    if (s == "unique")
        return std::make_unique<UniqueOperator>();
    if (s == "pitchclasses" || s == "pc" || s == "pcs")
        return std::make_unique<PitchClassesOperator>();
    if (s == "zip")
        return ZipOperator::parse(args);
    if (s == "int")
        return std::make_unique<IntOperator>();
    if (s == "size")
        return std::make_unique<SizeOperator>();

    throw std::domain_error("Invalid mode " + s);

}


// ==============================================================================================

class ser_util : public object<ser_util> {
private:
    std::unique_ptr<UtilityOperator> m_operator;
    Parameters m_params;

    InletTriggerHandler m_inlet_triggers{true};

public:
    static const inline std::string CLASS_NAME = "ser.util";

    MIN_DESCRIPTION{"Utility Functions for the Serialist Package"};
    MIN_TAGS{""};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.op"};

    inlet<> inlet_main{this, Inlets::voices(Types::number, "input (0)"), "", [this]() { return inlet_is_hot(0); }};
    Vec<std::unique_ptr<inlet<>>> m_extra_inlets;

    outlet<> outlet_main{this, Inlets::voices(Types::number, "output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    // Note: we don't need auto-restore, load/save state or enabled for this object

    argument<atoms> mode_arg{this, "mode", "Mode of operation"}; // TODO: List valid values

    explicit ser_util(const atoms& args = {}) {

        if (auto mode = parse_mode(args)) {
            m_operator = mode.move_ok();
            create_extra_inlets(m_operator->num_inlets());
        } else {
            error(mode.err().message());
        }
    }

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
        }
    }};


    // Doesn't target a Sequence/Variable so value_attribute isn't applicable here
    attribute<double> nullreplacement{ this, "nullreplacement", Parameters::DEFAULT_NULL_REPLACEMENT, setter{
        MIN_FUNCTION {
            if (auto v = AtomParser::atoms2value<double>(args)) {
                m_params.null_replacement = *v;
                return args;
            }

            cerr << "bad argument for message \"nullreplacement\"" << endl;
            return nullreplacement;
        }
    }};


    attribute<double> tolerance{ this, "tolerance", Parameters::DEFAULT_TOLERANCE, setter{
        MIN_FUNCTION {
            if (auto v = AtomParser::atoms2value<double>(args)) {
                m_params.tolerance = *v;
                return args;
            }

            cerr << "bad argument for message \"tolerance\"" << endl;
            return tolerance;
        }
    }};

    attribute<bool> zip_broadcast{ this, "zipbroadcast", static_cast<bool>(Parameters::DEFAULT_ZIP_MODE), setter{
        MIN_FUNCTION {
            if (auto v = AtomParser::atoms2value<bool>(args)) {
                m_params.zip_mode = static_cast<ZipMode>(*v);
                return args;
            }

            cerr << "bad argument for message \"zipbroadcast\"" << endl;
            return zip_broadcast;
        }
    }};



    function handle_input = MIN_FUNCTION {
        if (auto res = m_operator->operator()(args, m_params, inlet, m_inlet_triggers.is_hot(inlet))) {
            if (!res->empty())
                outlet_main.send(res.ok());
        } else {
            cerr << res.err().message() << endl;
        }

        return {};

    };

    message<> bang{this, "bang", MIN_FUNCTION{
        if (auto res = m_operator->operator()()) {
            if (!res->empty()) {
                outlet_main.send(res.ok());
            }
        } else {
            cerr << res.err().message() << endl;
        }

        return {};
    }};


    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    static Result<std::unique_ptr<UtilityOperator>> parse_mode(const atoms& args) {
        if (args.empty()) {
            return Error{ErrorMessages::missing_argument(CLASS_NAME, "<mode>")};
        }

        if (auto mode_str = AtomParser::atom2value<std::string>(args[0])) {
            try {
                return string2operator(*mode_str, args);
            } catch (std::domain_error&) {
                return Error{CLASS_NAME + ": invalid operator: " + static_cast<std::string>(args[0])};
            } catch (std::invalid_argument& e) {
                return Error{CLASS_NAME + e.what()};
            }
        }

        return Error{CLASS_NAME + ": the first argument must be a symbol"};
    }

    void create_extra_inlets(std::size_t num_inlets) {
        // initial i=1 to account for `inlet_main`
        for (std::size_t i = 1; i < m_operator->num_inlets(); ++i) {
            auto inlet_name = "input (" + std::to_string(i) + ")";
            m_extra_inlets.append(std::make_unique<inlet<>>(
                this
                , inlet_name
                , ""
                , [this, i] { return inlet_is_hot(i); }));
        }

        m_inlet_triggers = InletTriggerHandler(num_inlets);
    }

    bool inlet_is_hot(std::size_t inlet_index) const {
        return m_operator->num_inlets() == 1 || m_inlet_triggers.is_hot(inlet_index);
    }
};


MIN_EXTERNAL(ser_util);