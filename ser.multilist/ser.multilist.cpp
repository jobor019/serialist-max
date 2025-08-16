
#include <collections/stack.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "message_stereotypes.h"


using namespace c74::min;



class VecGenerator {
public:

    enum class Keyword {
        range,
        linspace,
        ones,
        zeros,
        repeat,
        binarypattern,
    };


    VecGenerator() = delete;

    static Result<Vec<double>> parse(Keyword keyword, const atoms& args, bool args_contains_keyword = true) {
        auto args_without_keyword = args_contains_keyword ? AtomParser::drop_first_n(args, 1) : args;

        switch (keyword) {
            case Keyword::range:
                return parse_range(args_without_keyword);
            case Keyword::linspace:
                return parse_linspace(args_without_keyword);
            case Keyword::ones:
                return parse_ones(args_without_keyword);
            case Keyword::zeros:
                return parse_zeros(args_without_keyword);
            case Keyword::repeat:
                return parse_repeat(args_without_keyword);
            case Keyword::binarypattern:
                return parse_binary_pattern(args_without_keyword);
            default:
                return Error{"Unknown keyword: " + static_cast<std::string>(magic_enum::enum_name(keyword))};
        }
    }

    static std::optional<Keyword> parse_keyword(const atoms& args) {
        if (args.empty()) {
            return std::nullopt;
        }

        if (auto potential_keyword = AtomParser::atom2value<std::string>(args[0])) {
            auto keyword = lowercase(*potential_keyword);

            // note: keyword could either be invalid or correspond to a default Voices symbol, e.g. "[" or "null". This
            //       returns std::nullopt in both cases
            return magic_enum::enum_cast<Keyword>(keyword);
        }

        return std::nullopt;
    }


    /**
     * @param args Supports two formats:
     *              (a) <end>, will yield a range from 0 to <end> (exclusive) where <end> is a positive integer
     *              (b) <start> <end> will yield a range from <start> to <end> (exclusive), where <start> and <end> are
     *                  integers. If <start> is larger than <end>, the range will be reversed
     */
    static Result<Vec<double>> parse_range(const atoms& args) {
        if (auto range_args = AtomParser::atoms2vec<int>(args)) {
            if (range_args->empty()) {
                return Error{"missing argument for message \"range\""};
            }

            int start = 0;
            int end = 0;

            if (range_args->size() == 1) {
                if ((*range_args)[0] <= 0) {
                    return Error{"invalid argument for message \"range\""};
                }

                end = (*range_args)[0];

            } else {
                start = (*range_args)[0];
                end = (*range_args)[1];
            }

            if (start > end) {
                auto tmp = start;
                start = end;
                end = tmp;
            }

            return Vec<int>::range(start, end).as_type<double>();

        } else {
            return Error{range_args.err().message()};
        }
    }


    /**
     * @param args Supports three formats:
     *             (a) <start> <end> (default num = 10, default include_endpoint = false)
     *             (b) <start> <end> <num> (default include_endpoint = false)
     *             (c) <start> <end> <num> <include_endpoint>
     *             If <start> is larger than <end>, the range will be reversed
     *
     */
    static Result<Vec<double>> parse_linspace(const atoms& args) {
        if (auto linspace_args = AtomParser::atoms2vec<double>(args)) {
            if (linspace_args->size() < 2) {
                return Error{"too few arguments for message \"linspace\""};
            }

            double start = (*linspace_args)[0];
            double end = (*linspace_args)[1];

            std::size_t num = 10;

            if (linspace_args->size() >= 3) {
                num = static_cast<std::size_t>(std::max(0.0, (*linspace_args)[2]));
            }

            bool include_endpoint = false;

            if (linspace_args->size() >= 4) {
                include_endpoint = static_cast<bool>((*linspace_args)[3]);
            }

            return Vec<double>::linspace(start, end, num, include_endpoint);

        } else {
            return Error{linspace_args.err().message()};
        }
    }


    static Result<Vec<double>> parse_ones(const atoms& args) {
        if (args.empty()) {
            return Error{"too few arguments for message \"ones\""};
        }

        if (auto num = AtomParser::atom2value<int>(args[0])) {
            return Vec<double>::ones(static_cast<std::size_t>(std::max(0,*num)));
        } else {
            return Error{num.err().message()};
        }
    }


    static Result<Vec<double>> parse_zeros(const atoms& args) {
        if (args.empty()) {
            return Error{"too few arguments for message \"zeros\""};
        }

        if (auto num = AtomParser::atom2value<int>(args[0])) {
            return Vec<double>::zeros(static_cast<std::size_t>(std::max(0,*num)));
        } else {
            return Error{num.err().message()};
        }
    }


    static Result<Vec<double>> parse_repeat(const atoms& args) {
        if (args.size() < 2) {
            return Error{"too few arguments for message \"repeat\""};
        }

        if (auto repeat_args = AtomParser::atoms2vec<double>(args)) {
            std::size_t num = static_cast<std::size_t>(std::round(std::max(0.0, (*repeat_args)[0])));
            double value = (*repeat_args)[1];

            return Vec<double>::repeated(num, value);
        } else {
            return Error{repeat_args.err().message()};
        }
    }


    /**
     * @brief generate a pattern of power of 2-spaced values, typically for generating beat-aligned velocity maps, etc.
     * @param args <num> <value1> <value2> ... <default_value>
     *          Examples:
     *          - binarypattern 3 100 80 => (num=3, value1=100, default_value=80) => 100 80 80
     *          - binarypattern 16 3 2 1 0 => 3 0 0 0 1 0 0 0 2 0 0 0 1 0 0 0
     * @return
     */
    static Result<Vec<double>> parse_binary_pattern(const atoms& args) {
        if (args.size() < 2) {
            return Error{"too few arguments for message \"binarypattern\""};
        }

        if (auto binary_pattern_args = AtomParser::atoms2vec<double>(args)) {
            std::size_t num = static_cast<std::size_t>(std::round(std::max(0.0, (*binary_pattern_args)[0])));

            if (num == 0)
                return {{}};
            if (num == 1)
                return Vec<double>::singular((*binary_pattern_args)[1]);

            bool has_default_value = binary_pattern_args->size() > 2;
            std::size_t num_pattern_values = has_default_value ? binary_pattern_args->size() - 1 : binary_pattern_args->size();

            double default_value = has_default_value ? (*binary_pattern_args)[binary_pattern_args->size() - 1] : 0.0;
            Vec<double> binarypattern_values = binary_pattern_args->slice(1, num_pattern_values);

            auto result = Vec<double>::repeated(num, default_value);

            if (binarypattern_values.empty()) {
                return result;
            }

            result[0] = binarypattern_values[0];

            for (std::size_t i = binarypattern_values.size(); i > 1; --i) {
                std::size_t pattern_idx = i - 1;
                std::size_t divisor = 1ULL << pattern_idx; // 2^pattern_idx: 2, 4, 8, 16, ...
                std::size_t interval = num / divisor;

                if (interval > 0) {
                    for (std::size_t pos = interval; pos < num; pos += interval * 2) {
                        result[pos] = binarypattern_values[pattern_idx];
                    }
                }
            }

            return result;

        } else {
            return Error{binary_pattern_args.err().message()};
        }
    }


    /** @brief this is similar to Voices<T>::tranposed() except that it allows empty outer lists */
    static Vec<Vec<double>> transposed(const Vec<double>& vec) {
        if (vec.empty()) {
            return {};
        }

        auto output = Vec<Vec<double>>::allocated(vec.size());
        for (double v: vec) {
            output.append(Vec<double>::singular(v));
        }

        return output;
    }

private:
    static std::string lowercase(const std::string& s) {
        std::string result = s;
        std::transform(result.begin(), result.end(), result.begin(),
                       [](char c) { return std::tolower(c); });
        return result;
    }
};


class ser_multilist : public object<ser_multilist> {

    /* Note: we're using Vec<Vec<double>> instead of Voices<double>> because we want to allow empty outer lists
     *       (not just empty-like). Note that the output from the Max objecthowever doesn't distinguish between empty
     *       and empty-like lists, e.g. `[]` (empty) and `[ [] ]` (empty-like) will both yield `"null"`.
     */
    using ContainerType = Vec<Vec<double>>;

    static const inline auto EMPTY_LIST_FORMATTED = AtomFormatter::voices2atoms<double>(Voices<double>::empty_like());

    static constexpr std::size_t MAX_HISTORY = 100;

    static const inline auto INITIAL_ARGS_DESCRIPTION = "Initial value of multilist (default: []). This also supports "
                                                        "all generator keywords such as \"range\" and \"linspace\".";

    static const inline auto RESET_DESCRIPTION = Inlets::voices(Types::number, "Set entire multilist and trigger output");
    static const inline auto APPEND_DESCRIPTION = Inlets::voice(Types::number, "Append list");
    static const inline auto REMOVE_DESCRIPTION = Inlets::voice(Types::number, "Remove list at given index(es)");

    static const inline auto INSERT_DESCRIPTION = "Insert list at given index";
    static const inline auto REPLACE_DESCRIPTION = "Replace list at given index";
    static const inline auto SET_DESCRIPTION = "Set entire multilist without triggering output";
    static const inline auto SET_SINGULAR_DESCRIPTION = "Set entire list to a single chord (yielding a multilist of size 1) without triggering output";
    static const inline auto SINGULAR_DESCRIPTION = "Set entire list to a single chord (yielding a multilist of size 1) and trigger output";

    static const inline auto EXTEND_DESCRIPTION = "Extend multilist by the content of another multilist. "
                                                  "This also supports keywords such as \"range\"";
    static const inline auto RANGE_DESCRIPTION = "Set entire list to a range of consecutive integer values"; // TODO: explain arguments
    static const inline auto LINSPACE_DESCRIPTION = "Set entire list to a evenly spaced numbers over a specified interval"; // TODO: explain arguments
    static const inline auto ONES_DESCRIPTION = "Set entire list to a vector of ones"; // TODO: explain arguments
    static const inline auto ZEROS_DESCRIPTION = "Set entire list to a vector of zeros"; // TODO: explain arguments
    static const inline auto REPEAT_DESCRIPTION = "Set entire list to a vector of repeated values"; // TODO: explain arguments

    static const inline auto BINARYPATTERN_DESCRIPTION = "TODO"; // TODO: explain arguments

    static const inline auto ITER_DESCRIPTION = "Output each list in the multilist iteratively on the second outlet";


    static const inline auto ERROR_OUT_OF_BOUNDS = "outofbounds";

    static constexpr std::size_t MAIN_INLET = 0;
    static constexpr std::size_t APPEND_INLET = 1;
    static constexpr std::size_t REMOVE_INLET = 2;

    ContainerType m_multilist;

    bool m_update_attribute_only = false;

    Stack<ContainerType> m_history{MAX_HISTORY};

public:
    MIN_DESCRIPTION{""};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"array, pattr, pattrstorage, ser.chordthresh, bach.reg, bach.shelf"};

    inlet<> inlet_main{this, Inlets::voices(Types::number, RESET_DESCRIPTION), "", true};
    inlet<> inlet_append{this, APPEND_DESCRIPTION, "", true};
    inlet<> inlet_remove{this, REMOVE_DESCRIPTION, "", true};

    outlet<> outlet_main{this, Inlets::voices(Types::number, "Updated multilist")};
    outlet<> outlet_queries{this, Inlets::voice(Types::number, "Query output")};
    outlet<> dumpout{this, Inlets::DUMPOUT};

    argument<atoms> m_args{this, "initial", INITIAL_ARGS_DESCRIPTION};


    explicit ser_multilist(const atoms& args = {}) {
        if (!args.empty()) {
            if (auto keyword = VecGenerator::parse_keyword(args)) {
                if (auto v = VecGenerator::parse(*keyword, args, true)) {
                    reset(Voices<double>::transposed(*v).vec());
                } else {
                    cerr << v.err().message() << endl;
                    return;
                }
            } else if (auto v = parse_container_type(args, true)) {
                m_multilist.extend(*v);

            } else {
                cerr << v.err().message() << endl;
                return;
            }
        }
    }


    attribute<atoms> m_value{ this, "value", EMPTY_LIST_FORMATTED, visibility::hide, setter{
            MIN_FUNCTION {
                /* There are two scenarios where m_value is set:
                 *   (1) internally with m_value.set(...)
                 *   (2) externally by Max (by user calling the `value` attribute or more likely through pattr)
                 *
                 * To prevent endless loops, we use the m_set_attribute_only flag in all internal calls.
                 * This means that we'll still update the attribute value so that pattr recognizes the change,
                 * but we won't update the internal value (m_multilist) as this has already been done, and we won't
                 * check the format of the input as we already know it's well-formed.
                 *
                 * While this seems convoluted, this is the only way to handle this, given how an attribute
                 * is both a function and a value at the same time.
                 */

                // Case (1): Internal call: Update the attribute without any further processing
                if (m_update_attribute_only) {
                    m_update_attribute_only = false;
                    return args;
                }


                // Case (2): External call: Try to update the internal value, and update the attribute if successful
                if (reset_without_calling_setter(args)) {
                    return args;
                }
                return m_value;
            }
        }
    };


    message<> m_reset{this, "reset", RESET_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"reset\" for inlet " << inlet << endl;
            return {};
        }

        reset(args);
        return {};
    }}};


    message<> m_set{this, "set", SET_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"set\" for inlet " << inlet << endl;
            return {};
        }

        reset(args, false);

        return {};
    }}};


    message<> m_singular{this, "singular", SINGULAR_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"singular\" for inlet " << inlet << endl;
            return {};
        }

        if (auto vec = AtomParser::atoms2vec<double>(args)) {
            append_to_history(m_multilist);
            m_multilist = Voices<double>::singular(*vec).vec();
            update_attribute_and_output(m_multilist);
        } else {
            cerr << vec.err().message() << endl;
        }

        return {};
    }}};


    message<> m_set_singular{this, "setsingular", SET_SINGULAR_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"setsingular\" for inlet " << inlet << endl;
            return {};
        }

        if (auto vec = AtomParser::atoms2vec<double>(args)) {
            append_to_history(m_multilist);
            m_multilist = Voices<double>::singular(*vec).vec();
            update_attribute_only(m_multilist);
        } else {
            cerr << vec.err().message() << endl;
        }

        return {};
    }}};

    message<> m_append{this, "append", APPEND_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"append\" for inlet " << inlet << endl;
            return {};
        }

        append(args);

        return {};
    }}};


    message<> m_extend{this, "extend", EXTEND_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"extend\" for inlet " << inlet << endl;
            return {};
        }

        extend(args);

        return {};
    }}};


    message<> m_insert{this, "insert", INSERT_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"insert\" for inlet " << inlet << endl;
            return {};
        }

        if (args.size() < 2) {
            cerr << "too few arguments for message \"insert\"" << endl;
            return {};
        }

        // Note: we support both negative (strategy: sign) and unbounded (strategy: pad) indices
        if (auto index = AtomParser::atom2value<int>(args[0])) {
            if (auto vector = AtomParser::atoms2vec<double>(AtomParser::drop_first_n(args, 1))) {

                append_to_history(m_multilist);

                if (*index > 0) {
                    // if the index is greater than size, pad with empty vectors so that the index is valid
                    int n_pad = *index - static_cast<int>(m_multilist.size() + 1);

                    // This is most likely a user input error. To avoid crashes if the value is too large, we throw
                    // an error here instead. `extend` can be used to achieve the same effect without imposed limits.
                    if (n_pad > 1024) {
                        cerr << "index too large: " << *index << endl;
                        return {};
                    }

                    for (int i = 0; i < n_pad; i++) {
                        m_multilist.append(Vec<double>{});
                    }
                }

                if (auto bounded_index = parse_bounded_index(args[0], ContainerType::BoundLimit::after)) {
                    m_multilist.insert(*bounded_index, *vector);
                    update_attribute_and_output(m_multilist);
                } else {
                    // Out of bounds errors: user need to be able to react to this programmatically
                    dumpout.send("insert", ERROR_OUT_OF_BOUNDS, args[0]);
                }
            } else {
                cerr << vector.err().message() << endl;
            }

        } else {
            cerr << index.err().message() << endl;
        }

        return {};
    }}};


    message<> m_replace{this, "replace", REPLACE_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"replace\" for inlet " << inlet << endl;
            return {};
        }

        if (args.size() < 2) {
            cerr << "too few arguments for message \"replace\"" << endl;
            return {};
        }

        if (auto bounded_index = parse_bounded_index(args[0])) {
            if (auto vector = AtomParser::atoms2vec<double>(AtomParser::drop_first_n(args, 1))) {
                m_multilist.replace(*bounded_index, *vector);
                update_attribute_and_output(m_multilist);
            } else {
                // Parsing errors: print a message to the console (user should be notified)
                cerr << vector.err().message() << ". could not replace value" <<endl;
            }

        } else {
            // Out of bounds errors: user need to be able to react to this programmatically
            dumpout.send("replace", ERROR_OUT_OF_BOUNDS, args[0]);
        }

        return {};
    }}};


    message<> m_undo{this, "undo", "Undo the last change", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"undo\" for inlet " << inlet << endl;
            return {};
        }

        if (auto last_state = m_history.pop()) {
            m_multilist = *last_state;
            update_attribute_and_output(m_multilist);
            // Note: we obviously don't append anything to history here
        }
        // else: the history is empty. No error message is provided in this case to avoid cluttering the console

        return {};
    }}};


    message<> m_clear{this, "clear", "Clear the entire multilist and trigger output", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"clear\" for inlet " << inlet << endl;
            return {};
        }

        append_to_history(m_multilist);
        m_multilist.clear();
        update_attribute_and_output(m_multilist);

        return {};
    }}};


    function handle_input = MIN_FUNCTION {
        if (inlet == REMOVE_INLET) {
            remove(args);
        } else if (inlet == APPEND_INLET) {
            append(args);
        } else {
            reset(args);
        }

        return {};
    };

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // QUERIES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    message<> m_iter{this, "iter", ITER_DESCRIPTION, MIN_FUNCTION {
        for (const auto& vector : m_multilist) {
            outlet_queries.send(AtomFormatter::vec2atoms<double>(vector));
        }
        outlet_queries.send({"iter", "done"});

        return {};
    }};

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // GENERATORS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    message<> m_range{this, "range", RANGE_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"range\" for inlet " << inlet << endl;
            return {};
        }

        if (auto range = VecGenerator::parse_range(args)) {
            reset(VecGenerator::transposed(*range));
        } else {
            cerr << range.err().message() << endl;
        }

        return {};
    }}};


    message<> m_linspace{this, "linspace", LINSPACE_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"linspace\" for inlet " << inlet << endl;
            return {};
        }

        if (auto linspace = VecGenerator::parse_linspace(args)) {
            reset(VecGenerator::transposed(*linspace));
        } else {
            cerr << linspace.err().message() << endl;
        }

        return {};
    }}};


    message<> m_ones{this, "ones", ONES_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"ones\" for inlet " << inlet << endl;
            return {};
        }

        if (auto ones = VecGenerator::parse_ones(args)) {
            reset(VecGenerator::transposed(*ones));
        } else {
            cerr << ones.err().message() << endl;
        }
        return {};
    }}};


    message<> m_zeros{this, "zeros", ZEROS_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"zeros\" for inlet " << inlet << endl;
            return {};
        }

        if (auto zeros = VecGenerator::parse_zeros(args)) {
            reset(VecGenerator::transposed(*zeros));
        } else {
            cerr << zeros.err().message() << endl;
        }
        return {};
    }}};


    message<> m_repeat{this, "repeat", REPEAT_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"repeat\" for inlet " << inlet << endl;
            return {};
        }

        if (auto repeat = VecGenerator::parse_repeat(args)) {
            reset(VecGenerator::transposed(*repeat));
        } else {
            cerr << repeat.err().message() << endl;
        }

        return {};
    }}};


    message<> m_binarypattern{this, "binarypattern", BINARYPATTERN_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"binarypattern\" for inlet " << inlet << endl;
            return {};
        }

        if (auto binarypattern = VecGenerator::parse_binary_pattern(args)) {
            reset(VecGenerator::transposed(*binarypattern));
        } else {
            cerr << binarypattern.err().message() << endl;
        }

        return {};
    }}};


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    message<> bang{this, "bang", "Output the current value", setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"bang\" for inlet " << inlet << endl;
            return {};
        }

        output_formatted_multilist(m_value.get(), m_multilist);

        return {};
    }}};

    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);


private:

    // called by setter itself
    bool reset_without_calling_setter(const atoms& new_state) {
        if (auto v = parse_container_type(new_state, true)) {
            append_to_history(std::move(m_multilist));
            m_multilist = *v;
            output_formatted_multilist(new_state, m_multilist);
            return true;
        } else {
            cerr << v.err().message() << endl;
            return false;
        }
    }

    // called from inlet
    void reset(const atoms& new_state, bool trigger_output = true) {
        if (auto v = parse_container_type(new_state, false)) {
            append_to_history(std::move(m_multilist));
            m_multilist = *v;
            update_attribute_only(new_state); // input was well-formed: throughput on the outlet
            if (trigger_output) {
                output_formatted_multilist(new_state, m_multilist); // input was well-formed: throughput on the outlet
            }
        } else {
            cerr << v.err().message() << endl;
        }
    }


    void reset(const ContainerType& new_state) {
        append_to_history(m_multilist);
        m_multilist = new_state;
        update_attribute_and_output(m_multilist);
    }


    void append(const atoms& args) {
        if (auto v = AtomParser::atoms2vec<double>(args)) {
            append_to_history(m_multilist);
            m_multilist.append(*v);
            update_attribute_and_output(m_multilist);

        } else {
            cerr << v.err().message() << endl;
        }
    }


    void extend(const atoms& args) {
        if (args.empty()) {
            cerr << "too few arguments for message \"extend\"" << endl;
            return;
        }

        if (auto keyword = VecGenerator::parse_keyword(args)) {
            if (auto v = VecGenerator::parse(*keyword, args, true)) {
                append_to_history(m_multilist);
                m_multilist.extend(Voices<double>::transposed(*v).vec());
            } else {
                cerr << v.err().message() << endl;
                return;
            }
        } else if (auto v = parse_container_type(args, true)) {
            append_to_history(m_multilist);
            m_multilist.extend(*v);

        } else {
            cerr << v.err().message() << endl;
            return;
        }

        update_attribute_and_output(m_multilist);
    }


    void remove(const atoms& args) {
        if (args.empty()) {
            cerr << "too few arguments for message \"remove\"" << endl;
            return;
        }

        auto indices_to_remove = Vec<std::size_t>::allocated(args.size());

        for (const auto& arg: args) {
            if (auto bounded_index = parse_bounded_index(arg)) {
                indices_to_remove.append(*bounded_index);
            } else {
                // If any index is not well-formed, abort
                dumpout.send({"remove", ERROR_OUT_OF_BOUNDS, arg});
                cerr << bounded_index.err().message() << ". no values were removed" << endl;
                return;
            }
        }

        append_to_history(m_multilist);
        m_multilist.erase(indices_to_remove);

        update_attribute_and_output(m_multilist);
    }


    void update_attribute_and_output(const ContainerType& multilist_unformatted) {
        update_attribute_and_output(format(multilist_unformatted), multilist_unformatted);
    }


    void update_attribute_and_output(const atoms& multilist_formatted, const ContainerType& actual) {
        update_attribute_only(multilist_formatted);
        output_formatted_multilist(multilist_formatted, actual);
    }


    void update_attribute_only(const atoms& multilist_formatted) {
        m_update_attribute_only = true; // this flag will immediately be reset by the setter
        m_value.set(multilist_formatted);
    }


    void update_attribute_only(const ContainerType& multilist_unformatted) {
        if (multilist_unformatted.empty()) {
            update_attribute_only(EMPTY_LIST_FORMATTED);
        } else {
            update_attribute_only(format(multilist_unformatted));
        }
    }


    void output_formatted_multilist(const atoms& multilist_formatted, const ContainerType& actual) {
        atoms size_info{"size"};
        size_info.push_back(actual.size());
        dumpout.send(size_info);

        outlet_main.send(multilist_formatted);
    }


    /** @brief Read the value as an index and check its validity. */
    Result<std::size_t> parse_bounded_index(atom arg, ContainerType::BoundLimit limit_type = ContainerType::BoundLimit::before) const {
        if (auto index = AtomParser::atom2value<int>(arg)) {

            if (auto bounded_index = m_multilist.bounded_index(*index, limit_type)) {
                return {*bounded_index};
            } else {
                return Error{"index " + std::to_string(*index) + " out of bounds"};
            }

        } else {
            return Error{index.err().message()};
        }
    }

    void append_to_history(const ContainerType& previous_state) {
        append_to_history(std::move(previous_state.cloned()));
    }

    void append_to_history(ContainerType&& previous_state) {
        m_history.push(std::move(previous_state));
    }

    static atoms format(const ContainerType& v) {
        // To reiterate earlier note: an empty list (`[]`) and an empty-like list (`[ [] ]`) will both yield `"null"`.
        if (v.empty()) {
            return EMPTY_LIST_FORMATTED;
        }

        return AtomFormatter::voices2atoms<double>(Voices<double>{v});
    }

    static Result<ContainerType> parse_container_type(const atoms& args, bool parse_null_as_empty) {
        // Note: Since the list is parsed as a Voices<double>, "null" actually means an empty-like Voices rather
        //       than an empty Vec<Vec<double>>. To properly initialize the object as a completely empty object,
        //       we'll therefore treat empty-like Voices passed to the setter as empty, at least when passed
        //       from the setter.
        if (parse_null_as_empty && parsing::is_null(args)) {
            return ContainerType{};
        }

        if (auto v = AtomParser::atoms2voices<double>(args)) {
            return v->vec();
        } else {
            return Error{v.err().message()};
        }
    }

};


MIN_EXTERNAL(ser_multilist);