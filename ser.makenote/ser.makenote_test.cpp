#include "c74_min_unittest.h"
#include "ser.op.cpp"


TEST_CASE("object is constructible") {
    ext_main(nullptr);

    test_wrapper<op> an_instance;
    op& obj = an_instance;

}
