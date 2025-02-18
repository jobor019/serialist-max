#include "serialist_transport.h"


SerialistTransport& SerialistTransport::get_instance() {
    static SerialistTransport instance;
    return instance;
}


TimePoint SerialistTransport::update_time() {
    std::lock_guard lock{m_mtx};
    return m_transport.update_time();
}


TimePoint SerialistTransport::get_time() {
    std::lock_guard lock{m_mtx};
    return m_transport.get_time();
}


TimePoint SerialistTransport::start() {
    std::lock_guard lock{m_mtx};
    return m_transport.start();
}


TimePoint SerialistTransport::pause() {
    std::lock_guard lock{m_mtx};
    return m_transport.pause();
}


TimePoint SerialistTransport::reset() {
    std::lock_guard lock{m_mtx};
    return m_transport.reset();
}


TimePoint SerialistTransport::stop() {
    std::lock_guard lock{m_mtx};
    return m_transport.stop();
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
