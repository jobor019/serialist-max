#include "c74_min_unittest.h"
#include "ser.selector.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<selector> an_instance;
    selector& obj = an_instance;

}
