#include <serialist_transport.h>
#include <core/policies/policies.h>
#include <core/generatives/router.h>

#include "c74_min.h"
#include "parsing.h"
#include "max_stereotypes.h"
#include "max_timepoint.h"
#include "message_stereotypes.h"


using namespace c74::min;
using namespace serialist;


// ==============================================================================================

class MaxRouterBase {
public:
    using Keys = RouterNode<Facet>::Keys;

    MaxRouterBase() = default;
    virtual ~MaxRouterBase() = default;
    MaxRouterBase(const MaxRouterBase&) = delete;
    MaxRouterBase& operator=(const MaxRouterBase&) = delete;
    MaxRouterBase(MaxRouterBase&&) = default;
    MaxRouterBase& operator=(MaxRouterBase&&) = default;

    virtual bool set_input(std::size_t inlet_index, const atoms& args, logger& cerr) = 0;
    virtual void process(std::vector<std::unique_ptr<outlet<>>>& outlets, logger& cerr) = 0;


    ParameterHandler ph;

    Sequence<Facet, double> routing_map{Keys::ROUTING_MAP, ph};
    Variable<Facet, RouterMode> mode{Keys::MODE, ph, RouterDefaults::MODE};
    Variable<Facet, bool> uses_index{Keys::USES_INDEX, ph, RouterDefaults::USE_INDEX};
    Variable<Facet, FlushMode> flush_mode{Keys::FLUSH_MODE, ph, RouterDefaults::FLUSH_MODE};

    Variable<Facet, bool> enabled{param::properties::enabled, ph, true};
};


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class MaxFacetRouter : public MaxRouterBase {
public:
    using SequenceType = Sequence<Facet, double>;

    MaxFacetRouter(std::size_t num_inlets, std::size_t num_outlets)
        : m_inlets(WrapperUtils::create_inputs<SequenceType>(num_inlets, ph))
        , m_router_node(Keys::CLASS_NAME
                      , ph
                      , num_outlets
                      , WrapperUtils::cast_inputs<Facet, SequenceType>(m_inlets)
                      , &routing_map
                      , &mode
                      , &uses_index
                      , &flush_mode
                      , &enabled) {}


    bool set_input(std::size_t inlet_index, const atoms& args, logger& cerr) override {
        assert(inlet_index < m_inlets.size());

        if (auto input = AtomParser::atoms2voices<double>(args); input.is_ok()) {
            m_inlets[inlet_index]->set_values(*input);
            return true;
        } else {
            cerr << input.err().message() << endl;
            return false;
        }
    }


    void process(std::vector<std::unique_ptr<outlet<>>>& outlets, logger&) override {
        m_router_node.update_time(SerialistTransport::get_instance().get_time());
        auto output = m_router_node.process();

        assert(output.size() == outlets.size());

        for (std::size_t i = 0; i < output.size(); ++i) {
            // no need to reindex here: first index in output corresponds to first index in outlets
            outlets[i]->send(AtomFormatter::voices2atoms<double>(output[i]));
        }
    }

private:
    Vec<std::unique_ptr<SequenceType>> m_inlets;
    RouterNode<Facet> m_router_node;
};

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class MaxPulseRouter : public MaxRouterBase {
public:
    using SequenceType = Sequence<Trigger>;

    MaxPulseRouter(std::size_t num_inlets, std::size_t num_outlets)
        : m_inlets(WrapperUtils::create_inputs<SequenceType>(num_inlets, ph))
        , m_router_node(Keys::CLASS_NAME
                      , ph
                      , num_outlets
                      , WrapperUtils::cast_inputs<Trigger, SequenceType>(m_inlets)
                      , &routing_map
                      , &mode
                      , &uses_index
                      , &flush_mode
                      , &enabled) {}


    bool set_input(std::size_t inlet_index, const atoms& args, logger& cerr) override {
        assert(inlet_index < m_inlets.size());

        if (auto input = AtomParser::atoms2triggers(args); input.is_ok()) {
            m_inlets[inlet_index]->set_values(*input);
            return true;
        } else {
            cerr << input.err().message() << endl;
            return false;
        }
    }


    void process(std::vector<std::unique_ptr<outlet<>>>& outlets, logger& cerr) override {
        m_router_node.update_time(SerialistTransport::get_instance().get_time());
        auto output = m_router_node.process();

        assert(output.size() == outlets.size());

        for (std::size_t i = 0; i < output.size(); ++i) {
            // no need to reindex here: first index in output corresponds to first index in outlets
            TriggerStereotypes::output_as_triggers_sorted(output[i], *outlets[i], cerr);
        }

        clear_inlets();
    }

private:
    void clear_inlets() {
        for (auto& inlet : m_inlets) {
            inlet->set_values(Voices<Trigger>::empty_like());
        }
    }

    Vec<std::unique_ptr<SequenceType>> m_inlets;
    RouterNode<Trigger> m_router_node;
};


// ==============================================================================================

struct RouterDescriptions {
    const static inline description MODE{"Mode TODO"};
    const static inline description MAPPING{"Router Control TODO"};
};


// ==============================================================================================

class ser_router : public object<ser_router> {
private:
    std::unique_ptr<MaxRouterBase> m_router;
    Types m_type = Types::number;

    static const inline std::string CLASS_NAME = "ser.router";


public:
    MIN_DESCRIPTION{"Multi-tool for routing signals and pulses"};
    MIN_TAGS{"utilities"};
    MIN_AUTHOR{"Borg"};
    MIN_RELATED{"ser.pulsefilter, ser.util"};

    inlet<> inlet_main{this, Inlets::voices(m_type, "Router control"), "", [this]{ return mapping_trigger.get(); }};
    std::vector<std::unique_ptr<inlet<>>> m_inlets;

    outlet<> dumpout{this, Inlets::DUMPOUT}; // Do we put this first to ensure alignment?
    std::vector<std::unique_ptr<outlet<>>> m_outlets;



    /**
     * @param args num_inlets (default = 1), num_outlets (default = 1), type (default = 0/number/facet)
     */
    explicit ser_router(const atoms& args = {}) {
        if (auto is_pulse = parse_type_is_pulse(args); !is_pulse.is_ok()) {
            error(is_pulse.err().message());
        } else {
            std::size_t num_inlets = parse_num_inlets(args);
            std::size_t num_outlets = parse_num_outlets(args);

            if (args.size() > 3) {
                cwarn << ErrorMessages::extra_argument(CLASS_NAME) << endl;
            }

            create_router_inlets(num_inlets, *is_pulse);
            create_router_outlets(num_outlets, *is_pulse);

            if (*is_pulse) {
                m_type = Types::pulse;
                m_router = std::make_unique<MaxPulseRouter>(num_inlets, num_outlets);
            } else {
                m_type = Types::number;
                m_router = std::make_unique<MaxFacetRouter>(num_inlets, num_outlets);
            }
        }
    }


    SER_AUTO_RESTORE_ATTRIBUTE();


    attribute<bool> quiet{this, "quiet", false, description{"suppress runtime warnings"}, saved{true}};

    // attribute<bool> triggers{this, AttributeNames::TRIGGERS}; // TODO: Triggers for routing inlets

    attribute<bool> mapping_trigger{this, "mapping_trigger", false, title{"Mapping Trigger"}
        , description{"Trigger on mapping change"}, saved{true}};


    // Can't use value_attribute here since we need to check for instantiation
    attribute<bool> enabled{
        this
        , AttributeNames::ENABLED
        , true
        , Descriptions::ENABLED
        , setter{
            MIN_FUNCTION {
                if (!instantiated())
                    return enabled;

                if (AttributeSetters::try_set_value(args, m_router->enabled, cerr)) {
                    return args;
                }
                return enabled;
            }
        }
    };


    // Can't use value_attribute here since we need to check for instantiation and mode validity
    attribute<RouterMode> mode{ this, "mode", RouterDefaults::MODE, RouterDescriptions::MODE, setter{
            MIN_FUNCTION {
                if (!instantiated())
                    return mode;

                if (auto v = AtomParser::atoms2value<RouterMode>(args)) {
                    if (validate_mode(*v)) {
                        m_router->mode.set_value(*v);
                        return args;
                    }
                    return mode; // error already printed by `validate_mode`

                } else {
                    cerr << v.err().message() << endl;
                }

                return mode;
            }
        }
    };


    // Can't use value_attribute here since we need to check for instantiation
    attribute<bool> index{this, AttributeNames::USE_INDEX, RouterDefaults::USE_INDEX
        ,Descriptions::USE_INDEX_WITHOUT_OCTAVE, setter{
            MIN_FUNCTION {
                if (!instantiated())
                    return index;

                if (AttributeSetters::try_set_value(args, m_router->uses_index, cerr)) {
                    return args;
                }

                return {};
            }
        }
    };


    message<> setup = Messages::setup_message_with_loadstate(this, [this](LoadState& s) {
        s >> enabled >> mode >> index;
    });


    message<> savestate = Messages::savestate_message(this, autorestore, [this](SaveState& s) {
        s << enabled << mode << index;
    });


    function handle_input = MIN_FUNCTION {
        assert(instantiated());

        if (inlet == 0) {
            if (set_mapping(args) && mapping_trigger.get()) {
                process();
            }
        } else {
            set_input(args, inlet);
            process();
        }
        return {};
    };

    message<> bang = Messages::bang_message(this, handle_input);
    message<> list = Messages::list_message(this, handle_input);
    message<> number = Messages::number_message(this, handle_input);
    message<> list_of_list = Messages::list_of_list_message(this, handle_input);
    message<> anything = Messages::anything_message(this, handle_input);


private:
    bool set_mapping(const atoms& args) {
        if (auto mapping = AtomParser::atoms2voices<double>(args); mapping.is_ok()) {
            m_router->routing_map.set_values(mapping.ok());
            return true;
        } else {
            cerr << mapping.err().message() << endl;
            return false;
        }
    }


    bool set_input(const atoms& args, int inlet) {
        assert(inlet != 0); // inlet 0 is for mapping
        assert(instantiated());

        // inlet: converted to 0-index
        return m_router->set_input(inlet - 1, args, cerr);
    }

    void process() {
        assert(instantiated());

        if (!SerialistTransport::get_instance().active()) {
            return;
        }

        auto t1 = std::chrono::high_resolution_clock::now();

        m_router->process(m_outlets, cerr);

        auto t2 = std::chrono::high_resolution_clock::now();

        std::cout << std::chrono::duration_cast<std::chrono::microseconds>(t2-t1).count() << " usec\n";

    }


    bool instantiated() const {
        return m_router != nullptr;
    }


    void create_router_inlets(std::size_t num_inlets, bool is_pulse) {
        auto type = is_pulse ? Types::pulse : Types::number;

        for (std::size_t i = 0; i < num_inlets; ++i) {
            // Note: description is 0-indexed as that's the format of our mapping
            m_inlets.emplace_back(std::make_unique<inlet<>>(
                this
                , Inlets::voices(type, "Inlet " + std::to_string(i))
            ));
        }

    }


    void create_router_outlets(std::size_t num_outlets, bool is_pulse) {
        auto type = is_pulse ? Types::pulse : Types::number;

        for (std::size_t i = 0; i < num_outlets; ++i) {
            // Note: description is 0-indexed as that's the format of our mapping
            m_outlets.emplace_back(std::make_unique<outlet<>>(
                this
                , Inlets::voices(type, "Outlet " + std::to_string(i))
            ));
        }
    }


    static std::size_t parse_num_inlets(const atoms& args) {
        if (!args.empty()) {
            if (args[0].type() == message_type::int_argument) {
                return std::max(1, static_cast<int>(args[0]));
            }
        }
        return 1; // default if no explicit arg provided
    }


    static std::size_t parse_num_outlets(const atoms& args) {
        if (args.size() > 1) {
            if (args[1].type() == message_type::int_argument) {
                return std::max(1, static_cast<int>(args[1]));
            }
        }
        return 1; // default if no explicit arg provided
    }


    static Result<bool> parse_type_is_pulse(const atoms& args) {
        if (args.size() > 2) {
            if (args[2].type() == message_type::int_argument) {
                return static_cast<bool>(args[2]);
            } else if (args[2].type() == message_type::symbol_argument) {
                auto s = static_cast<std::string>(args[2]);

                std::transform(s.begin(), s.end(), s.begin(),
                   [](unsigned char c) { return std::tolower(c); });

                if (s == Inlets::NUMBER_TYPE) {
                    return false;
                } else if (s == Inlets::PULSE_TYPE) {
                    return true;
                } else {
                    return Error("unknown type: " + s + " (must be number (0) or pulse (1))");
                }
            }
        }
        return false; // default if no explicit arg provided
    }


    bool validate_mode(RouterMode mode) {
        auto mode_str = static_cast<std::string>(magic_enum::enum_name(mode));

        if (mode == RouterMode::through) {
            if (num_inlets() != num_outlets()) {
                try_warn("number of inlets and outlets should equal for through mode. "
                         "Extra inlets and outlets will be ignored");
            }
            return true;
        }

        if (mode == RouterMode::merge || mode == RouterMode::mix) {
            if (num_inlets() == 1) {
                cerr << "at least 2 inlets are required for " << mode_str << " mode" << endl;
                return false;
            }

            if (num_outlets() > 1) {
                try_warn("only one outlet is required for " + mode_str + " mode. Extra outlets will be ignored");
            }
            return true;
        }

        if (mode == RouterMode::split || mode == RouterMode::distribute) {
            if (num_outlets() == 1) {
                cerr << "at least 2 outlets are required for " << mode_str << " mode" << endl;
                return false;
            }

            if (num_inlets() > 1) {
                try_warn("only one inlet is required for " + mode_str + " mode. Extra inlets will be ignored");
            }
            return true;
        }

        return true; // Mode::route supports any number of inlets and outlets
    }


    void try_warn(std::string&& s) {
        if (!quiet.get()) {
            cwarn << s << endl;
        }
    }


    std::size_t num_inlets() const { return m_inlets.size(); }
    std::size_t num_outlets() const { return m_outlets.size(); }

};


MIN_EXTERNAL(ser_router);