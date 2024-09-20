#include "c74_min_unittest.h"
#include "ser.slidermapping.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<slidermapping> an_instance;
    slidermapping& obj = an_instance;

}
