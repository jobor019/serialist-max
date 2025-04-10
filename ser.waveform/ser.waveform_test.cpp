#include "c74_min_unittest.h"
#include "ser.waveform.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_waveform> an_instance;
    ser_waveform& obj = an_instance;

}
