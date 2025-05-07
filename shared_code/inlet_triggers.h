
#ifndef SERIALIST_MAX_INLET_TRIGGERS_H
#define SERIALIST_MAX_INLET_TRIGGERS_H

#include <array>
#include "c74_min_api.h"
#include "parsing.h"

class InletTriggerHandler {
public:
    static constexpr int ALL_HOT = -1;

    explicit InletTriggerHandler(std::size_t num_inlets) {
        assert(num_inlets > 0);
        // Default: first is hot, rest is cold
        m_is_hot = Vec<bool>::zeros(num_inlets);
        m_is_hot[0] = true;
    }

    explicit InletTriggerHandler(const Vec<bool>& initial) : m_is_hot(initial) {
        // size cannot be changed after initialization. Therefore, at least one inlet is required
        assert(!initial.empty());
    }

    InletTriggerHandler(std::initializer_list<bool> initial) : m_is_hot{initial} {
        assert(initial.size() > 0);
    }


    template<typename T>
    static Voices<Trigger> triggers_like(const Voices<T>& v) {
        if (v.is_empty_like()) {
            return Voices<Trigger>::empty_like();
        }

        return Voices<Trigger>::repeated(Trigger::without_id(Trigger::Type::pulse_on), v.size());
    }

    bool try_set_triggers_from_index_list(const c74::min::atoms& index_list, c74::min::logger& cerr) {
        if (auto r = set_triggers_from_index_list(index_list)) {
            return true;
        } else {
            cerr << r.err().message();
            return false;
        }
    }

    Result<Vec<int>> set_triggers_from_index_list(const c74::min::atoms& index_list) {
        auto r = AtomParser::atoms2vec<int>(index_list);

        if (r.is_ok()) {
            if (r->size() == 1 && (*r)[0] == ALL_HOT) {
                set_all_as_hot();
                return r;
            }

            set_all_as_cold();
            for (const auto& index : *r) {
                if (index < m_is_hot.size()) {
                    m_is_hot[index] = true;
                }
            }
        }
        return r;
    }

    static void set_triggers_from_boolean_mask(const c74::min::atoms& boolean_mask) {
        throw std::runtime_error("not implemented");
    }


    bool is_hot(std::size_t index) const {
        assert(index < m_is_hot.size());
        return m_is_hot[index];
    }

private:
    void set_all_as_cold() { set_all_as(false); }
    void set_all_as_hot() { set_all_as(true); }

    void set_all_as(bool state) {
        for (std::size_t i = 0; i < m_is_hot.size(); ++i) {
            m_is_hot[i] = state;
        }
    }



    Vec<bool> m_is_hot;

};

#endif //SERIALIST_MAX_INLET_TRIGGERS_H
