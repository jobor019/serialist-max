#include <magic_enum.hpp>
#include "exceptions.h"
#include "parameter_policy.h"
#include <iostream>


int main() {

    ParameterHandler p;
    AtomicParameter<int> v(2, "hehe", p);
    std::cout << v.get() << "\n";

try {
    throw IOError("");
} catch (IOError& e) {
        std::cout << "caught it";
    }
    return 0;
}
