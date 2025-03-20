#include "c74_min_unittest.h"
#include "ser.phasemap.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<phasemap> an_instance;
    phasemap& obj = an_instance;

}
