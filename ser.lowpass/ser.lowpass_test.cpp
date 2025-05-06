#include "c74_min_unittest.h"
#include "ser.lowpass.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_lowpass> an_instance;
    ser_lowpass& obj = an_instance;

}
