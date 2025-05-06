
#ifndef SERIALIST_MAX_SERIALIST_ATTRIBUTES_H
#define SERIALIST_MAX_SERIALIST_ATTRIBUTES_H

#include "attribute_setters.h"
#include "c74_min_api.h"


enum class input_format { value, vector, vector_singular, voices };

/**
 * @brief pseudo-attribute base class for passing pseudo-attributes without template args
 */
class pseudo_attribute_base {
protected:
    c74::min::atoms m_stored_value;
    std::string m_name;

public:
    pseudo_attribute_base(const std::string& name, const c74::min::atoms& value)
    : m_stored_value{ value }, m_name{ name } {}

    virtual ~pseudo_attribute_base() = default;

    const std::string& name() const { return m_name; }
    const c74::min::atoms& get_stored_atoms() const { return m_stored_value; }

    virtual void set(const c74::min::atoms& args) = 0;
};

/**
 * @brief wrapper around a Sequence that may receive nulls and/or lists of lists (Voices<T>), but fundamentally is
 *        a message, not an attribute. Pseudo attributes can be stored with `savestate`, but
 *          - does not have a default value
 *          - accepts mixes of symbols and int/double types (e.g. `null`, `[ [ 1 ] [ 2 ] ]`, `1 null 3`, ...)
 *          - are not visible in the inspector or settable with `\@attribute` syntax
 */
template<typename StoredType
         , typename OutputType = Facet
         , c74::min::threadsafe threadsafety = c74::min::threadsafe::undefined>
class pseudo_attribute : public pseudo_attribute_base
                       , public c74::min::message<threadsafety> {
private:
    Sequence<OutputType, StoredType>& m_target;
    c74::min::logger& m_cerr;
    input_format m_format;
    std::mutex* m_mutex;
    std::optional<std::function<void()>> m_post_setter_function;

public:
    // Note: pseudo_attribute is NOT safe to use for classes that has unique_ptr-owned owned Sequence/Variable.
    //       While the message will never be invoked before the min::object's constructor, the pseudo_attribute will
    //       be constructed before the min::object's constructor, and the referenced `target` will therefore be invalid.
    pseudo_attribute(c74::min::object_base* an_owner
                     , const std::string& a_name
                     , Sequence<OutputType, StoredType>& target
                     , c74::min::logger& cerr
                     , const c74::min::description& a_description = ""
                     , input_format format = input_format::voices
                     , std::mutex* mutex = nullptr
                     , std::optional<std::function<void()>> post_setter_function = std::nullopt)
        : pseudo_attribute_base(a_name, c74::min::atoms{})
        , c74::min::message<threadsafety>(
            an_owner
            , a_name
            , a_description
            , [this, &a_name, &cerr](const c74::min::atoms& args, const int inlet) {
                if (inlet != 0) {
                    cerr << "invalid message \"" << a_name << "\" for inlet " << inlet <<
                            c74::min::endl;
                    return c74::min::atoms{};
                }

                this->set(args);
                return c74::min::atoms{};
            })
        , m_target(target)
        , m_cerr(cerr)
        , m_format(format)
        , m_mutex(mutex)
        , m_post_setter_function(std::move(post_setter_function)) {}

    // Note: messages' setter functions are not invoked when constructed (unlike attributes), and it's therefore
    //       safe to construct a lambda which calls the member function like this.
    void set(const c74::min::atoms& args) override {
        if (m_format == input_format::voices) {
            // Note: leading bracket should under no situation be stripped. Messages::list_of_list_message prepends
            //       the removed bracket, so there should never be any conflict here
            if (AttributeSetters::try_set_voices(args, m_target, m_cerr, false, m_mutex)) {
                m_stored_value = args;
                invoke_post_setter_function();
            }
            return;
        }

        if (m_format == input_format::vector) {
            if (AttributeSetters::try_set_vector(args, m_target, m_cerr, m_mutex)) {
                this->m_stored_value = args;
                invoke_post_setter_function();
            }
            return;
        }

        if (m_format == input_format::vector_singular) {
            if (AttributeSetters::try_set_vector_singular(args, m_target, m_cerr, m_mutex)) {
                this->m_stored_value = args;
                invoke_post_setter_function();
            }
            return ;
        }

        if (m_format == input_format::value) {
            if (AttributeSetters::try_set_value(args, m_target, m_cerr, m_mutex)) {
                this->m_stored_value = args;
                invoke_post_setter_function();
            }
            return;
        }

        m_cerr << "unknown format \"" << m_format << "\" for attribute \"" << m_name << "\"" << c74::min::endl;
    }

    const c74::min::atoms& get_atoms() const {
        return m_stored_value;
    }

private:
    void invoke_post_setter_function() const {
        if (m_post_setter_function) {
            (*m_post_setter_function)();
        }
    }
};


// ==============================================================================================

/**
 * @brief Thin wrapper around a c74::min::attribute that accepts a single value and sets a Sequence or Variable
 *
 * @tparam StoredType   internal type of related Sequence/Variable (e.g. double, std::string, int, ...)
 * @tparam MaxType      corresponding max attribute type (e.g. double, symbol, int, ...)
 * @tparam OutputType   external type of related Sequence/Variable (typ. Facet)
 * @tparam threadsafety threadsafety spec
 * @tparam repetitions  repetitions spec
 */
template<typename StoredType
         , typename MaxType = StoredType
         , typename OutputType = Facet
         , c74::min::threadsafe threadsafety = c74::min::threadsafe::undefined
         , c74::min::allow_repetitions repetitions = c74::min::allow_repetitions::undefined>
class value_attribute : public c74::min::attribute<MaxType, threadsafety,  c74::min::limit::none, repetitions> {
public:
    template <typename TargetType, typename... ARGS>
    value_attribute(c74::min::object_base* an_owner
                    , const std::string& a_name
                    , TargetType& target
                    , const StoredType& a_default_value
                    , c74::min::logger& cerr
                    , const std::string& a_title = ""
                    , std::mutex* mutex = nullptr
                    , ARGS... args)
        : c74::min::attribute<MaxType, threadsafety,  c74::min::limit::none, repetitions>(
            an_owner
            , a_name
            , a_default_value
            , a_title.empty() ? AttributeSetters::name_to_title(a_name) : AttributeSetters::to_title(a_title)
            , c74::min::setter{[this, &target, &cerr, mutex](const c74::min::atoms& atms, const int) {
                if (AttributeSetters::try_set_value(atms, target, cerr, mutex)) {
                    return atms;
                }
                return this->get_atoms();

            }}
            , args...) {
        static_assert(
                std::is_same_v<TargetType, Sequence<OutputType, StoredType>> ||
                std::is_same_v<TargetType, Variable<OutputType, StoredType>>,
                "Target must be either Sequence<OutputType, StoredType> or Variable<OutputType, StoredType>"
            );
    }


    virtual ~value_attribute() = default;
};


// ==============================================================================================

/**
 * @brief Thin wrapper around a c74::min::attribute that accepts a vector and sets a Sequence
 * @note  Attributes cannot use mixed types and therefore do not support lists of lists and/or nulls as input.
 *        if this is needed, use `pseudo_attribute` instead
 *
 * @tparam StoredType   internal type of related Sequence (e.g. double, std::string, int, ...)
 * @tparam MaxType      corresponding max attribute type (e.g. double, symbol, int, ...)
 * @tparam OutputType   external type of related Sequence (typ. Facet)
 * @tparam threadsafety threadsafety spec
 */
template<typename StoredType
         , typename MaxType = StoredType
         , typename OutputType = Facet
         , c74::min::threadsafe threadsafety = c74::min::threadsafe::undefined>
class vector_attribute : public c74::min::attribute<std::vector<MaxType>, threadsafety> {
public:
    template <typename... ARGS>
    vector_attribute(c74::min::object_base* an_owner
                    , const std::string& a_name
                    , Sequence<OutputType, StoredType>& target
                    , const StoredType& a_default_value
                    , c74::min::logger& cerr
                    , const std::string& a_title = ""
                    , std::mutex* mutex = nullptr
                    , ARGS... args)
        : c74::min::attribute<std::vector<MaxType>, threadsafety>(
            an_owner
            , a_name
            , std::vector<MaxType>{static_cast<MaxType>(a_default_value)}
            , a_title.empty() ? AttributeSetters::name_to_title(a_name) : AttributeSetters::to_title(a_title)
            , c74::min::setter{[this, &target, &cerr, mutex](const c74::min::atoms& atms, const int) {
                if (AttributeSetters::try_set_vector(atms, target, cerr, mutex)) {
                    return atms;
                }
                return this->get_atoms();

            }}
            , args...) { }


    virtual ~vector_attribute() = default;
};


// ==============================================================================================
// ATTRIBUTE MACROS
// ==============================================================================================

// While macro definitions generally are undesirable, this is the only way to create specialized stereotypes
// for attributes since the attribute class' move constructor is deleted, and we therefore cannot provide
// custom constructors or factory methods


#define SER_ENABLED_ATTRIBUTE(TARGET_MEMBER, MUTEX) \
    value_attribute<bool> enabled{this \
                                  , AttributeNames::ENABLED \
                                  , TARGET_MEMBER \
                                  , true \
                                  , cerr \
                                  , Titles::ENABLED \
                                  , MUTEX \
                                  , Descriptions::ENABLED};

#define SER_NUM_VOICES_ATTRIBUTE(TARGET_MEMBER, MUTEX) \
    value_attribute<std::size_t, int> voices{this \
                                             , AttributeNames::NUM_VOICES \
                                             , TARGET_MEMBER \
                                             , 0 \
                                             , cerr \
                                             , Titles::NUM_VOICES \
                                             , MUTEX \
                                             , Descriptions::NUM_VOICES};

#define SER_AUTO_RESTORE_ATTRIBUTE() \
    attribute<bool> autorestore{this \
                                , AttributeNames::AUTO_RESTORE \
                                , false \
                                , Titles::AUTO_RESTORE \
                                , saved{true} \
                                , Categories::STATE \
                                , Descriptions::AUTO_RESTORE \
                                , setter{ \
    MIN_FUNCTION { \
        if (args.size() == 1 && args[0].type() == message_type::int_argument) { \
            return args; \
        } \
        return autorestore; \
    }}}



#endif //SERIALIST_MAX_SERIALIST_ATTRIBUTES_H
