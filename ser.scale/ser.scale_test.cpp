#include "c74_min_unittest.h"
#include "ser.map.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_map> an_instance;
    ser_map& obj = an_instance;

}
