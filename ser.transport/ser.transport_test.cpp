#include "c74_min_unittest.h"
#include "ser.transport.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_transport> an_instance;
    ser_transport& obj = an_instance;

}
