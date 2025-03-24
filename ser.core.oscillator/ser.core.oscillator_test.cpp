#include "c74_min_unittest.h"
#include "ser.core.oscillator.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<oscillator> an_instance;
    oscillator& obj = an_instance;

}
