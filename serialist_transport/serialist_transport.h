#ifndef TRANSPORT_SINGLETON_H
#define TRANSPORT_SINGLETON_H
#include <mutex>
#include <thread>

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
         */
        virtual void on_transport_state_change(bool active) = 0;
    };


    ~SerialistTransport();
    SerialistTransport(SerialistTransport const&) = delete;
    void operator=(SerialistTransport const&) = delete;
    SerialistTransport(SerialistTransport&&) noexcept = delete;
    SerialistTransport& operator=(SerialistTransport&&) noexcept = delete;

    static SerialistTransport& get_instance();

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
    SerialistTransport();

    void update_time();

    void notify_listeners(const TimePoint&);

    Transport m_transport{false};
    std::atomic<TimePoint> m_current_time{};
    std::mutex m_transport_mtx{};

    std::thread m_update_thread;
    std::atomic<bool> m_should_terminate{false};

    Vec<Listener*> m_listeners{};
};


#endif //TRANSPORT_SINGLETON_H
