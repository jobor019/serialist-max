#include "c74_min_unittest.h"
#include "ser.pulsefilter.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_pulsefilter> an_instance;
    ser_pulsefilter& obj = an_instance;

}
