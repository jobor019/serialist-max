#ifndef TRANSPORT_SINGLETON_H
#define TRANSPORT_SINGLETON_H
#include "temporal/transport.h"


using namespace serialist;


class SerialistTransport {
public:
    static SerialistTransport& get_instance();

    ~SerialistTransport() = default;
    SerialistTransport(SerialistTransport const&) = delete;
    void operator=(SerialistTransport const&) = delete;
    SerialistTransport(SerialistTransport&&) noexcept = delete;
    SerialistTransport& operator=(SerialistTransport&&) noexcept = delete;

    TimePoint get_time();
    TimePoint start();
    TimePoint pause();
    TimePoint reset();
    TimePoint stop();

    void set_tempo(double tempo);

    bool active();

private:
    SerialistTransport() = default;

    Transport m_transport{false};

    std::mutex m_mtx{};
};


#endif //TRANSPORT_SINGLETON_H
