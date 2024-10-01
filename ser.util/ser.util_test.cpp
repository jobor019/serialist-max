#include "c74_min_unittest.h"
#include "ser.util.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_util> an_instance;
    ser_util& obj = an_instance;

}
