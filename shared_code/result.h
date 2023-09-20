#include <iostream>
#include <utility>
#include <variant>
#include <string>

using Error = std::string;

template<typename T>
class Result {
public:
    Result(const T& value) : m_value(value), m_error(std::nullopt) {}

    Result(const Error& error) : m_value(std::nullopt), m_error(error) {}


    bool is_ok() const noexcept {
        return m_value.has_value();
    }


//    T unwrap() const {
//        if (m_is_ok) {
//            return m_value;
//        } else {
//            throw std::runtime_error("Unwrapping an error is not supported");
//        }
//    }


    /**
     * @throws std::runtime_error
     */
    Error err() const {
        if (!m_error)
            throw std::runtime_error("Result is not an error");

        return m_error.value();
    }


    /**
     * @throws std::runtime_error
     */
    T ok() const {
        if (!m_value)
            throw std::runtime_error("Result is an error");
        return *m_value;
    }


private:
    std::optional<T> m_value;
    std::optional<Error> m_error;
};
