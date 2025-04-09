#include "c74_min_unittest.h"
#include "ser.random.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_random> an_instance;
    ser_random& obj = an_instance;

}
