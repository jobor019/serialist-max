#include "c74_min_unittest.h"
#include "ser.index.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_index> an_instance;
    ser_index& obj = an_instance;

}
