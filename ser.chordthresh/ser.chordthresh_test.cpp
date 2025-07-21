#include "c74_min_unittest.h"
#include "ser.chordthresh.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_chordthresh> an_instance;
    ser_chordthresh& obj = an_instance;

}
