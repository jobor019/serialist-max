#include <core/policies/policies.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"

using namespace c74::min;
using namespace serialist;

enum class UtilMode {
    len

};

inline UtilMode string2mode(const std::string& s) {
    if (s == "len") {
        return UtilMode::len;
    }
    throw std::domain_error("Invalid mode " + s);
}

class ser_util : public c74::min::object<ser_util> {
private:
    std::optional<UtilMode> m_mode;

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
        if (args.empty()) {
            error(ErrorMessages::missing_argument(CLASS_NAME, "<mode>"));
        } else {
            if (auto mode_str = AtomParser::atom2value<std::string>(args[0])) {
                try {
                    auto mode = string2mode(*mode_str);
                    m_mode = mode;
                } catch (std::domain_error&) {
                    error(CLASS_NAME + ": invalid operator: " + static_cast<std::string>(args[0]));
                }
            } else {
                error(CLASS_NAME + ": the first argument must be a symbol");
            }
        }

        if (args.size() > 1) {
            cwarn << ErrorMessages::extra_argument(CLASS_NAME) << endl;
        }
    }


    c74::min::function handle_input = MIN_FUNCTION {
        if (m_mode == UtilMode::len) {
            len(args);
        }


        return {};

    };


    message<> bang = Messages::bang_message(this, handle_input);
    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);

private:
    void len(const atoms& args) {
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

        outlet_main.send(len);
    }

};


MIN_EXTERNAL(ser_util);