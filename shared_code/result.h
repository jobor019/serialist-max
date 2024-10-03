#ifndef SERIALIST_RESULT_H
#define SERIALIST_RESULT_H

#include <iostream>
#include <utility>
#include <variant>
#include <string>

class ResultError : public std::runtime_error {
public:
    explicit ResultError(const std::string& msg) : std::runtime_error(msg) {}
};


class Error {
public:
    explicit Error(const std::string& msg) : m_msg(msg) {}


    const std::string& message() const {
        return m_msg;
    }

    const std::string& operator*() const {
        return m_msg;
    }

    friend c74::min::logger& operator<<(c74::min::logger& log, const Error& myClass) {
        log << myClass.message();
        return log;
    }

    friend std::ostream& operator<<(std::ostream& os, const Error& myClass) {
        os << myClass.message();
        return os;
    }



private:
    std::string m_msg;

};


// ==============================================================================================

template <typename T>
class Result;

template<>
class Result<void> {
public:
    Result() : m_error(std::nullopt) {}


    Result(const Error& error) : m_error(error) {} // NOLINT(*-explicit-constructor)


    explicit operator bool() const noexcept {
        return is_ok();
    }


    bool is_ok() const noexcept {
        return !m_error.has_value();
    }


    const Error& err() const {
        if (!m_error)
            throw ResultError("Result is not an error");
        return *m_error;
    }


private:
    std::optional<Error> m_error;
};

template<typename T>
class Result {
public:
    // ReSharper disable once CppNonExplicitConvertingConstructor
    Result(const T& value) : m_value(value), m_error(std::nullopt) {} // NOLINT(*-explicit-constructor)

    Result(T&& value) : m_value(std::move(value)), m_error(std::nullopt) {}

    // ReSharper disable once CppNonExplicitConvertingConstructor
    Result(const Error& error) : m_value(std::nullopt), m_error(error) {} // NOLINT(*-explicit-constructor)


    explicit operator bool() const noexcept {
        return is_ok();
    }


    const T& operator*() const {
        return ok();
    }

    decltype(auto) operator->() {
        if (!m_value) {
            throw ResultError(m_error->message());
        }
        return m_value.operator->();
    }


    bool is_ok() const noexcept {
        return m_value.has_value();
    }


    /**
     * @throws ResultError
     */
    const Error& err() const {
        if (!m_error)
            throw ResultError("Result is not an error");

        return *m_error;
    }


    /**
     * @throws ResultError
     */
    const T& ok() const {
        if (!m_value)
            throw ResultError(m_error->message());
        return *m_value;
    }


    /**
    * Move the underlying value of T if available, otherwise throws an exception.
    * Note that the Result object will be in an invalid state after calling this operator,
    * and should not be used hereafter.
    * @throws ResultError
    */
    T&& move_ok() {
        if (!m_value) {
            throw ResultError(m_error->message());
        }
        return std::move(*m_value);
    }


private:
    std::optional<T> m_value;
    std::optional<Error> m_error;
};

#endif // SERIALIST_RESULT_H