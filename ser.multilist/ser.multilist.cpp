
#include <collections/stack.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "message_stereotypes.h"


using namespace c74::min;

class ser_multilist : public object<ser_multilist> {

    /* Note: we're using Vec<Vec<double>> instead of Voices<double>> because we want to allow empty outer lists
     *       (not just empty-like). Note that the output from the Max objecthowever doesn't distinguish between empty
     *       and empty-like lists, e.g. `[]` (empty) and `[ [] ]` (empty-like) will both yield `"null"`.
     */
    using ContainerType = Vec<Vec<double>>;

    static const inline auto EMPTY_LIST_FORMATTED = AtomFormatter::voices2atoms<double>(Voices<double>::empty_like());

    static constexpr std::size_t MAX_HISTORY = 100;

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
    static const inline auto RANGE_DESCRIPTION = "Set entire list to a range of consecutive values";


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
            if (auto vector = AtomParser::atoms2vec<double>(drop_first_n(args, 1))) {

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
            if (auto vector = AtomParser::atoms2vec<double>(drop_first_n(args, 1))) {
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


    message<> m_range{this, "range", RANGE_DESCRIPTION, setter{MIN_FUNCTION {
        if (inlet != 0) {
            cerr << "invalid message \"range\" for inlet " << inlet << endl;
            return {};
        }

        if (auto range = generate_range(args)) {
            reset(*range);
        } // otherwise: error message already printed

        return {};
    }}};


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

        // First, we check if the first argument is a keyword rather than a value.
        // Note that it could also be "[" or "null", which obviously shouldn't be read as keywords
        if (auto potential_keyword = AtomParser::atom2value<std::string>(args[0])) {
            if (*potential_keyword == "range") {
                if (auto range = generate_range(drop_first_n(args, 1))) {
                    m_multilist.extend(*range);
                } else {
                    return; // keyword was "range" but arguments were not well-formed: error message already printed
                }
            }
            // TODO: Other keywords

        } else if (auto v = parse_container_type(args, true)) {
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


    std::optional<Vec<Vec<double>>> generate_range(const atoms& args) {
        if (auto range_args = AtomParser::atoms2vec<int>(args)) {
            if (range_args->empty()) {
                cerr << "missing argument for message \"range\"" << endl;
                return std::nullopt;
            }

            int start = 0;
            int end = 0;

            if (range_args->size() == 1) {
                if ((*range_args)[0] <= 0) {
                    return std::nullopt;
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

            return Vec<int>::range(start, end).as_type<Vec<double>>([](const int& i) {
                return Vec{static_cast<double>(i)};
            });

        } else {
            cerr << range_args.err().message() << endl;
            return std::nullopt;
        }
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

    static atoms drop_first_n(const atoms& args, std::size_t n) {
        atoms args_cloned{args};
        args_cloned.erase(args_cloned.begin(), args_cloned.begin() + n);
        return args_cloned;
    }

};


MIN_EXTERNAL(ser_multilist);