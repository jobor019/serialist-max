#include "serialist_transport.h"


SerialistTransport::SerialistTransport() {
    m_update_thread = std::thread([this] {
        while (!m_should_terminate) {
            std::this_thread::sleep_for(std::chrono::milliseconds(1));
            update_time();
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


void SerialistTransport::add_listener(Listener& listener) {
    std::lock_guard lock{m_transport_mtx};
    m_listeners.append(&listener);
}


void SerialistTransport::remove_listener(Listener& listener) {
    std::lock_guard lock{m_transport_mtx};
    m_listeners.remove(&listener);
}


TimePoint SerialistTransport::get_time() {
    return m_current_time;
}


TimePoint SerialistTransport::start() {
    std::lock_guard lock{m_transport_mtx};
    auto t = m_transport.start();;
    m_current_time = t;
    notify_listeners(t);
    return t;
}


TimePoint SerialistTransport::pause() {
    std::lock_guard lock{m_transport_mtx};
    auto t = m_transport.pause();
    m_current_time = t;
    notify_listeners(t);
    return t;
}


TimePoint SerialistTransport::reset() {
    std::lock_guard lock{m_transport_mtx};
    auto t = m_transport.reset();
    m_current_time = t;
    return t;
}


TimePoint SerialistTransport::stop() {
    std::lock_guard lock{m_transport_mtx};
    auto t = m_transport.stop();
    m_current_time = t;
    notify_listeners(t);
    return t;
}


void SerialistTransport::set_tempo(double tempo) {
    std::lock_guard lock{m_transport_mtx};
    m_transport.set_tempo(tempo);
}


void SerialistTransport::set_meter(const std::optional<Meter>& meter) {
    std::lock_guard lock{m_transport_mtx};
    m_transport.set_next_meter(meter);
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
