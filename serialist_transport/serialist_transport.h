#ifndef TRANSPORT_SINGLETON_H
#define TRANSPORT_SINGLETON_H
#include <mutex>
#include "temporal/transport.h"


using namespace serialist;


class SerialistTransport {
public:
    class Listener {
    public:
        virtual ~Listener() = default;

        /**
         * @brief called when the transport is activated or deactivated
         *
         * @note We assume that transport state always is changed either by the main (UI thread) in Max,
         *       **NOT** from the scheduler thread or any other thread. For this reason, it should be safe to use
         *       the callback in any non-guarded class
         *       TODO: Add assertions for this in start, pause and stop!
         *             Can be done with max::systhread_ismainthread(), but we're currently not linking the
         *             SerialistTransport library directly to the min api.
         */
        virtual void on_transport_state_update(const TimePoint& t) = 0;
    };


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

    void add_listener(Listener& listener);
    void remove_listener(Listener& listener);

    /**
    * @return a copy of the internal `TimePoint` without updating the internal `TimePoint`
    */
    TimePoint get_time();

    bool active();

private:
    SerialistTransport() = default;

    void notify_listeners(const TimePoint&);

    Transport m_transport{false};

    std::mutex m_mtx{};

    Vec<Listener*> m_listeners{};
};


#endif //TRANSPORT_SINGLETON_H
