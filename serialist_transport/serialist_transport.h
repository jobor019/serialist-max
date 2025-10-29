#ifndef TRANSPORT_SINGLETON_H
#define TRANSPORT_SINGLETON_H
#include <mutex>
#include <thread>
#include <string>

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


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    class Leader {
    public:
        virtual ~Leader() = default;

        /**
         * @brief called when the transport assigns this leader as the active leader
         */
        virtual void set_active_leader(bool active) = 0;
    };

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    ~SerialistTransport();
    SerialistTransport(SerialistTransport const&) = delete;
    void operator=(SerialistTransport const&) = delete;
    SerialistTransport(SerialistTransport&&) noexcept = delete;
    SerialistTransport& operator=(SerialistTransport&&) noexcept = delete;

    static SerialistTransport& get_instance();

    static void apply_detach(TimePoint& t, bool detach);

    bool start();
    bool pause();
    bool reset();
    bool stop();

    bool set_tempo(double tempo);
    bool set_meter(const std::optional<Meter>& meter);

    void set_time(const TimePoint& time);

    void add_listener(Listener& listener);
    void remove_listener(Listener& listener);

    void add_leader(Leader& leader);
    void remove_leader(Leader& leader);

    /**
    * @return a copy of the internal `TimePoint` without updating the internal `TimePoint`
    */
    TimePoint get_time();

    bool active();

private:
    SerialistTransport();

    void update_time();

    void notify_listeners(const TimePoint&);

    void notify_leaders();

    Transport m_transport{false};

    // last value produced by update_time when leaderless, otherwise last value provided by leader
    std::atomic<TimePoint> m_current_time{};
    std::mutex m_transport_mtx{};

    std::thread m_update_thread;
    std::atomic<bool> m_should_terminate{false};

    Vec<Listener*> m_listeners{};

    Vec<Leader*> m_leaders{};
    std::atomic<bool> m_has_leader{false};
};


#endif //TRANSPORT_SINGLETON_H
