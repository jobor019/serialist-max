#ifndef TRANSPORT_SINGLETON_H
#define TRANSPORT_SINGLETON_H
#include "temporal/transport.h"


using namespace serialist;


class SerialistTransport {
public:
    ~SerialistTransport() = default;
    SerialistTransport(SerialistTransport const&) = delete;
    void operator=(SerialistTransport const&) = delete;
    SerialistTransport(SerialistTransport&&) noexcept = delete;
    SerialistTransport& operator=(SerialistTransport&&) noexcept = delete;

    static SerialistTransport& get_instance();

    /**
    * @note: Since a lot of objects constantly will poll the transport within very small intervals (sub-ms levels),
    *        this function should generally only be called by a centralized `ser.transport` object,
    *        where all other objects should use `get_time()` instead
    */
    TimePoint update_time();
    TimePoint start();
    TimePoint pause();
    TimePoint reset();
    TimePoint stop();

    void set_tempo(double tempo);
    void set_meter(const std::optional<Meter>& meter);

    /**
    * @return a copy of the internal `TimePoint` without updating the internal `TimePoint`
    */
    TimePoint get_time();

    bool active();

private:
    SerialistTransport() = default;

    Transport m_transport{false};

    std::mutex m_mtx{};
};


#endif //TRANSPORT_SINGLETON_H
