
#include "c74_min_unittest.h"
#include "ser.playground.cpp"
#include "parsing.h"



TEST_CASE("object produces correct output") {
    ext_main(nullptr);

    test_wrapper<playground> an_instance;
    playground& playground = an_instance;

    REQUIRE(playground.inlets().size() == 1);
    playground.myattribute.set(c74::min::atoms{0.88});
    REQUIRE(playground.myattribute.get() == std::vector<double>{0.88});


    REQUIRE(playground.mymessage.name() == "mymessage");
    REQUIRE(playground.mymessage(c74::min::atoms{1,2,3}, 0) == c74::min::atoms{1,2,3});


}


// ==============================================================================================

TEST_CASE("Result class") {
    SECTION("Simple type initialization") {
        Result r1(8);
        REQUIRE(r1.is_ok());
        REQUIRE(*r1 == 8);
        REQUIRE_THROWS(r1.err());

        Result<int> r2(Error("error"));
        REQUIRE(!r2.is_ok());
        REQUIRE_THROWS(*r2);
        REQUIRE(r2.err().message() == "error");
        REQUIRE(*r2.err() == "error");
    }


    SECTION("Void") {
        Result<void> r1;
        REQUIRE(r1.is_ok());
        REQUIRE_THROWS(r1.err());
        REQUIRE(bool(r1) == true);

        Result<void> r2(Error("error"));
        REQUIRE(!r2.is_ok());
        REQUIRE(r2.err().message() == "error");
        REQUIRE(bool(r2) == false);

    }

    SECTION("String") {
        Result<std::string> r1("hello");
        REQUIRE(r1.is_ok());
        REQUIRE(r1->size() == 5); // test that -> operator works
    }
}


// ==============================================================================================

TEST_CASE("Parsing Lists of lists") {
    SECTION("Simple List") {
        c74::min::atoms atms{"[", 1, 2, 3, "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0] == Voice<int>{1});
        REQUIRE(result.ok()[1] == Voice<int>{2});
        REQUIRE(result.ok()[2] == Voice<int>{3});
    }

    SECTION("Single-element list") {
        c74::min::atoms atms{"[", 1, "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == Voice<int>{1});
    }

    SECTION("Empty list") {
        c74::min::atoms atms{"[", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0].empty());
    }

    SECTION("Nested list") {
        c74::min::atoms atms{"[", "[", 1, 2, 3, "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == Voice<int>{Voice<int>{1, 2, 3}});
    }

    SECTION("Multiple nested lists")    {
        c74::min::atoms atms{"[", "[", 1, 2, 3, "]", "[", 4, 5, 6, "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 2);
        REQUIRE(result.ok()[0] == Voice<int>{Voice<int>{1, 2, 3}});
        REQUIRE(result.ok()[1] == Voice<int>{Voice<int>{4, 5, 6}});
    }

    SECTION("Single-element nested list") {
        c74::min::atoms atms{"[", "[", 1, "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == Voice<int>{Voice<int>{1}});
    }


    SECTION("Empty nested list") {
        c74::min::atoms atms{"[", "[", "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0].empty());
    }

    SECTION("Missing ending bracket") {
        c74::min::atoms atms{"[", 1, 2, 3};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Missing opening bracket") {
        c74::min::atoms atms{1, 2, 3, "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Missing inner bracket") {
        c74::min::atoms atms{"[", 1, 2, 3, "]", 4, 5, 6, "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Three-levels nested list") {
        c74::min::atoms atms{"[", "[", "[", 1, 2, 3, "]", "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Premature end") {
        c74::min::atoms atms{"[", "[", 1, 2, 3};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("With stripped initial bracket") {
        // First symbol of input is typically stripped due to attribute<>/message<> parsing
        c74::min::atoms atms{1, 2, 3, "]"};

        SECTION("Parsing without bracket") {
            auto result = AtomParser::atoms2voices<int>(atms, true);
            REQUIRE(result.is_ok());
            REQUIRE(result->size() == 3);
            REQUIRE(result.ok()[0] == Voice<int>{1});
            REQUIRE(result.ok()[1] == Voice<int>{2});
            REQUIRE(result.ok()[2] == Voice<int>{3});
        }

        SECTION("Parsing with bracket re-prepended") {
            AtomParser::prepend_leading_bracket(atms);
            auto result = AtomParser::atoms2voices<int>(atms, false);
            REQUIRE(result.is_ok());
            REQUIRE(result->size() == 3);
            REQUIRE(result.ok()[0] == Voice<int>{1});
            REQUIRE(result.ok()[1] == Voice<int>{2});
            REQUIRE(result.ok()[2] == Voice<int>{3});
        }
    }
}