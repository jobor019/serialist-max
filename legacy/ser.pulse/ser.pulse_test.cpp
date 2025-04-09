#include "c74_min_unittest.h"
#include "ser.pulse.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_pulse> an_instance;
    ser_pulse& obj = an_instance;

}
