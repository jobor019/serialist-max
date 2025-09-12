#include "c74_min_unittest.h"
#include "ser.op.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<ser_op> an_instance;
    ser_op& obj = an_instance;

}
