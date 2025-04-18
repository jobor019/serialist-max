
#ifndef SERIALIST_MAX_INLET_TRIGGERS_H
#define SERIALIST_MAX_INLET_TRIGGERS_H

#include <array>
#include "c74_min_api.h"
#include "parsing.h"

template<std::size_t N = 2>
class InletTriggerHandler {
public:
    static constexpr int ALL_HOT = -1;

    explicit InletTriggerHandler(std::array<bool, N> initial) : m_is_hot(initial) {}

    InletTriggerHandler(std::initializer_list<bool> initial) {
        assert(initial.size() == N);
        std::copy(initial.begin(), initial.end(), m_is_hot.begin());
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
                m_is_hot[index] = true;
            }
        }
        return r;
    }

    static void set_triggers_from_boolean_mask(const c74::min::atoms& boolean_mask) {
        throw std::runtime_error("not implemented");
    }


    bool is_hot(std::size_t index) const { return m_is_hot[index]; }

private:
    void set_all_as_cold() { set_all_as(false); }
    void set_all_as_hot() { set_all_as(true); }

    void set_all_as(bool state) {
        for (std::size_t i = 0; i < N; ++i) {
            m_is_hot[i] = state;
        }
    }



    std::array<bool, N> m_is_hot;

};

#endif //SERIALIST_MAX_INLET_TRIGGERS_H
