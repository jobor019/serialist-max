#include "c74_min_unittest.h"
#include "ser.interpolator.cpp"


TEST_CASE("object produces correct output") {
    ext_main(nullptr);

    test_wrapper<interpolator> an_instance;
    interpolator& interpolator = an_instance;

}
