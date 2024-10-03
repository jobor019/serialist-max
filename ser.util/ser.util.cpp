#include <core/policies/policies.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"

using namespace c74::min;
using namespace serialist;

struct Parameters {
    double null_replacement{0.0};
};

// ==============================================================================================


class UtilityOperator {
public:
    virtual ~UtilityOperator() = default;

    virtual Result<atoms> operator()(const atoms& args, const Parameters& params) = 0;
};

class LenOperator : public UtilityOperator {
    Result<atoms> operator()(const atoms& args, const Parameters& params) override {
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


class NullMapOperator : public UtilityOperator {
public:
    Result<atoms> operator()(const atoms& args, const Parameters& params) override {
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

        return args;
    }
};


inline std::unique_ptr<UtilityOperator> string2operator(const std::string& s) {
    if (s == "len") {
        return std::make_unique<LenOperator>();
    }
    if (s == "nullmap") {
        return std::make_unique<NullMapOperator>();
    }
    throw std::domain_error("Invalid mode " + s);
}


// ==============================================================================================

class ser_util : public c74::min::object<ser_util> {
private:
    std::unique_ptr<UtilityOperator> m_operator;
    Parameters m_params;

public:
    static const inline std::string CLASS_NAME = "ser.util";

    MIN_DESCRIPTION{""};                   // TODO
    MIN_TAGS{""};                          // TODO
    MIN_AUTHOR{""};                        // TODO
    MIN_RELATED{""};                       // TODO

    inlet<> inlet_main{this, "(list/listoflists) ", ""}; // TODO

    outlet<> outlet_main{this, "output", ""}; // TODO
    outlet<> dumpout{this, "(any) dumpout"};


    explicit ser_util(const atoms& args = {}) {
        if (auto mode = parse_mode(args)) {
            m_operator = mode.move_ok();

            if (args.size() > 1) {
                cwarn << ErrorMessages::extra_argument(CLASS_NAME) << endl;
            }


        } else {
            error(mode.err().message());
        }
    }


    c74::min::function handle_input = MIN_FUNCTION {
        auto res = m_operator->operator()(args, m_params);
        if (res) {
            outlet_main.send(res.ok());
        } else {
            cerr << res.err().message() << endl;
        }

        return {};

    };


    attribute<double> nullreplacement{ this, "nullreplacement", 0.0, setter{
            MIN_FUNCTION {
                if (auto v = AtomParser::atoms2value<double>(args)) {
                    m_params.null_replacement = *v;
                    return args;
                }

                cerr << "bad argument for message \"nullreplacement\"" << endl;
                return nullreplacement;
            }
        }
    };


    message<> bang = Messages::bang_message(this, handle_input);
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
                return string2operator(*mode_str);
            } catch (std::domain_error&) {
                return Error{CLASS_NAME + ": invalid operator: " + static_cast<std::string>(args[0])};
            }
        }

        return Error{CLASS_NAME + ": the first argument must be a symbol"};
    }
};


MIN_EXTERNAL(ser_util);