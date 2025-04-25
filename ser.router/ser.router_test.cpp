#include "c74_min_unittest.h"
#include "ser.router.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_router> an_instance;
    ser_router& obj = an_instance;

}
