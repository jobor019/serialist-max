#include "serialist_transport.h"


SerialistTransport::SerialistTransport() {
    m_update_thread = std::thread([this] {
        while (!m_should_terminate) {
            if (!m_has_leader) {
                update_time();
            }
            std::this_thread::sleep_for(std::chrono::milliseconds(1));
        }
    });
}


SerialistTransport::~SerialistTransport() {
    m_should_terminate = true;
    if (m_update_thread.joinable()) {
        m_update_thread.join();
    }
}


SerialistTransport& SerialistTransport::get_instance() {
    static SerialistTransport instance;
    return instance;
}


void SerialistTransport::apply_detach(TimePoint& t, bool detach) {
    t.with_transport_running(t.get_transport_running() || detach);
}


void SerialistTransport::add_listener(Listener& listener) {
    std::lock_guard lock{m_transport_mtx};
    if (!m_listeners.contains(&listener)) {
        m_listeners.append(&listener);
    }
}


void SerialistTransport::remove_listener(Listener& listener) {
    std::lock_guard lock{m_transport_mtx};
    m_listeners.remove(&listener);
}


void SerialistTransport::add_leader(Leader& leader) {
    std::lock_guard lock{m_transport_mtx};
    if (!m_leaders.contains(&leader)) {
        m_leaders.append(&leader);
        notify_leaders();
    }
}


void SerialistTransport::remove_leader(Leader& leader) {
    std::lock_guard lock{m_transport_mtx};
    leader.set_active_leader(false);
    m_leaders.remove(&leader);
    notify_leaders();
}


TimePoint SerialistTransport::get_time() {
    return m_current_time;
}


bool SerialistTransport::start() {
    if (m_has_leader) {
        return false;
    }

    std::lock_guard lock{m_transport_mtx};
    auto t = m_transport.start();
    m_current_time = t;
    notify_listeners(t);
    return true;
}


bool SerialistTransport::pause() {
    if (m_has_leader) {
        return false;
    }

    std::lock_guard lock{m_transport_mtx};
    auto t = m_transport.pause();
    m_current_time = t;
    notify_listeners(t);
    return true;
}


bool SerialistTransport::reset() {
    if (m_has_leader) {
        return false;
    }

    std::lock_guard lock{m_transport_mtx};
    auto t = m_transport.reset();
    m_current_time = t;
    return true;
}


bool SerialistTransport::stop() {
    if (m_has_leader) {
        return false;
    }

    std::lock_guard lock{m_transport_mtx};
    auto t = m_transport.stop();
    m_current_time = t;
    notify_listeners(t);
    return true;
}


bool SerialistTransport::set_tempo(double tempo) {
    if (m_has_leader) {
        return false;
    }

    std::lock_guard lock{m_transport_mtx};
    m_transport.set_tempo(tempo);
    return true;
}


bool SerialistTransport::set_meter(const std::optional<Meter>& meter) {
    if (m_has_leader) {
        return false;
    }

    std::lock_guard lock{m_transport_mtx};
    m_transport.set_next_meter(meter);
    return true;
}


void SerialistTransport::set_time(const TimePoint& time) {
    assert(m_has_leader); // this should only be called by the leader, internal calls should use update_time()
    m_current_time = time;
}


bool SerialistTransport::active() {
    std::lock_guard lock{m_transport_mtx};
    return m_transport.active();
}


void SerialistTransport::update_time() {
    std::lock_guard lock{m_transport_mtx};
    m_current_time = m_transport.update_time();
}


void SerialistTransport::notify_listeners(const TimePoint& t) {
    for (auto& listener : m_listeners) {
        listener->on_transport_state_change(t.get_transport_running());
    }
}


void SerialistTransport::notify_leaders() {
    m_has_leader = !m_leaders.empty();

    if (m_has_leader) {
        m_leaders[0]->set_active_leader(true);

        for (std::size_t i = 1; i < m_leaders.size(); ++i) {
            m_leaders[i]->set_active_leader(false);
        }
    }
}
