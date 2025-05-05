#include "c74_min_unittest.h"
#include "ser.interpolate.cpp"


TEST_CASE("object produces correct output") {
    ext_main(nullptr);

    test_wrapper<ser_interpolator> an_instance;
    ser_interpolator& interpolator = an_instance;

}
