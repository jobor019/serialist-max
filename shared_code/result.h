#include <iostream>
#include <utility>
#include <variant>
#include <string>


class Error {
public:
    explicit Error(const std::string& msg) : m_msg(msg) {}

    

    const std::string& message() const {
        return m_msg;
    }


private:
    std::string m_msg;

};


// ==============================================================================================

template<typename T>
class Result {
public:
    Result(const T& value) : m_value(value), m_error(std::nullopt) {}

    Result(const Error& error) : m_value(std::nullopt), m_error(error) {}

    explicit operator bool() const noexcept {
        return is_ok();
    }

    T operator*() const {
        return ok();
    }


    bool is_ok() const noexcept {
        return m_value.has_value();
    }

    /**
     * @throws std::runtime_error
     */
    const Error& err() const {
        if (!m_error)
            throw std::logic_error("Result is not an error");

        return *m_error;
    }


    /**
     * @throws std::runtime_error
     */
    T ok() const {
        if (!m_value)
            throw std::logic_error("Result is an error");
        return *m_value;
    }


private:
    std::optional<T> m_value;
    std::optional<Error> m_error;
};
