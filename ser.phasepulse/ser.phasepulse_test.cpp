#include "c74_min_unittest.h"
#include "ser.phasepulse.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_phasepulse> an_instance;
    ser_phasepulse& obj = an_instance;

}
