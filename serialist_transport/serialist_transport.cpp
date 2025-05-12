#include "serialist_transport.h"


SerialistTransport& SerialistTransport::get_instance() {
    static SerialistTransport instance;
    return instance;
}


TimePoint SerialistTransport::update_time() {
    std::lock_guard lock{m_mtx};
    return m_transport.update_time();
}


void SerialistTransport::add_listener(Listener& listener) {
    std::lock_guard lock{m_mtx};
    m_listeners.append(&listener);
}


void SerialistTransport::remove_listener(Listener& listener) {
    std::lock_guard lock{m_mtx};
    m_listeners.remove(&listener);
}


TimePoint SerialistTransport::get_time() {
    std::lock_guard lock{m_mtx};
    return m_transport.get_time();
}


TimePoint SerialistTransport::start() {
    std::lock_guard lock{m_mtx};
    auto t = m_transport.start();;
    notify_listeners(t);
    return t;
}


TimePoint SerialistTransport::pause() {
    std::lock_guard lock{m_mtx};
    auto t = m_transport.pause();
    notify_listeners(t);
    return t;
}


TimePoint SerialistTransport::reset() {
    std::lock_guard lock{m_mtx};
    return m_transport.reset();
}


TimePoint SerialistTransport::stop() {
    std::lock_guard lock{m_mtx};
    auto t = m_transport.stop();
    notify_listeners(t);
    return t;
}


void SerialistTransport::set_tempo(double tempo) {
    std::lock_guard lock{m_mtx};
    m_transport.set_tempo(tempo);
}


void SerialistTransport::set_meter(const std::optional<Meter>& meter) {
    std::lock_guard lock{m_mtx};
    m_transport.set_next_meter(meter);
}


bool SerialistTransport::active() {
    std::lock_guard lock{m_mtx};
    return m_transport.active();
}


void SerialistTransport::notify_listeners(const TimePoint& t) {
    // private function: we assume that the mutex is held here
    // TODO: We should find a solution for asserting threads in Max, to ensure that this
    //       never is called from any other thread than the main thread. See comments in Listener
    for (auto& listener : m_listeners) {
        listener->on_transport_state_update(t);
    }
}
