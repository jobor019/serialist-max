#include "c74_min_unittest.h"
#include "ser.core.makenote.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_makenote> an_instance;
    ser_makenote& obj = an_instance;

}
