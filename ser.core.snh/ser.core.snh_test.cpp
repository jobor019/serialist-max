#include "c74_min_unittest.h"
#include "ser.core.snh.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_snh> an_instance;
    ser_snh& obj = an_instance;

}
