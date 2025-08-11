
#include "c74_min_unittest.h"
#include "ser.makenote.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_multilist> an_instance;
    ser_multilist& obj = an_instance;

}
