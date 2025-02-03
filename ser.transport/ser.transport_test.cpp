#include "c74_min_unittest.h"
#include "ser.transport.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<transport> an_instance;
    transport& obj = an_instance;

}
