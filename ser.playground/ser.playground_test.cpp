
#include "c74_min_unittest.h"
#include "ser.playground.cpp"
#include "parsing.h"


// ==============================================================================================
/**
 * Unit tests for shared code.
 * TODO Should ideally be moved to a separate file, but currently relies on a number of dependencies from c74::min
 *      and is therefore dependent on the c74::min cmake scripts as well as its modified catch2 framework at the moment
 */
// ==============================================================================================

TEST_CASE("Result class", "[shared_code]") {
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

enum class TestEnum {
    v0 = 0
    , v1 = 1
    , v2 = 2
    , v3 = 3
};

TEST_CASE("Parsing single atom", "[shared_code]") {
    SECTION("bool") {
        SECTION("parsing true") {
            atom v{true};
            auto result = AtomParser::atom2value<bool>(v);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == true);
        }

        SECTION("parsing false") {
            atom v{false};
            auto result = AtomParser::atom2value<bool>(v);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == false);
        }

        SECTION("bool from integral values") {
            atom v1{1};
            auto result = AtomParser::atom2value<bool>(v1);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == true);

            atom v2{0};
            result = AtomParser::atom2value<bool>(v2);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == false);

            atom v3{1000};
            result = AtomParser::atom2value<bool>(v3);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == true);

            atom v4{-1};
            result = AtomParser::atom2value<bool>(v4);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == false);
        }

    }

    SECTION("integral") {
        atom i1{1};
        auto result = AtomParser::atom2value<int>(i1);
        REQUIRE(result.is_ok());
        REQUIRE(result.ok() == 1);

        atom i2{2};
        result = AtomParser::atom2value<int>(i2);
        REQUIRE(result.is_ok());
        REQUIRE(result.ok() == 2);
    }

    SECTION("null") {
        atom v{"null"};
        auto result = AtomParser::atom2value<int>(v);
    }

    SECTION("floating") {
        // TODO

    }

    SECTION("symbols") {
        // TODO

    }

    SECTION("enums") {
        // TODO
    }
}


// ==============================================================================================

TEST_CASE("Parsing lists (Vec)", "[shared_code]") {
    SECTION("Simple list without brackets") {
        atoms atms{1, 2, 3};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0] == 1);
        REQUIRE(result.ok()[1] == 2);
        REQUIRE(result.ok()[2] == 3);
    }

    SECTION("Simple list with brackets") {
        atoms atms{"[", 1, 2, 3, "]"};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0] == 1);
        REQUIRE(result.ok()[1] == 2);
        REQUIRE(result.ok()[2] == 3);
    }

    SECTION("Empty list without brackets") {
        atoms atms{"[", "]"};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->empty());
    }

    SECTION("Empty list with brackets") {
        atoms atms;
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->empty());
    }

    SECTION("Single-element list without brackets") {
        atoms atms{1};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == 1);

    }

    SECTION("Single-element list with brackets") {
        atoms atms{"[", 1, "]"};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == 1);
    }

    SECTION("List of lists") {
        atoms atms{"[", "[", 1, 2, 3, "]", "]"};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(!result.is_ok());
    }
}


TEST_CASE("Parsing single trigger") {
    // TODO
}


TEST_CASE("Parsing list of triggers (Vec<Trigger>)") {
    // TODO
}


// ==============================================================================================

TEST_CASE("Parsing Lists of lists (Voices)", "[shared_code]") {
    SECTION("Simple List") {
        atoms atms{"[", 1, 2, 3, "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0] == Voice<int>{1});
        REQUIRE(result.ok()[1] == Voice<int>{2});
        REQUIRE(result.ok()[2] == Voice<int>{3});
    }

    SECTION("Single-element list") {
        atoms atms{"[", 1, "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == Voice<int>{1});
    }

    SECTION("Empty list") {
        atoms atms{"[", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0].empty());
    }

    SECTION("Nested list") {
        atoms atms{"[", "[", 1, 2, 3, "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == Voice<int>{Voice<int>{1, 2, 3}});
    }

    SECTION("Multiple nested lists") {
        atoms atms{"[", "[", 1, 2, 3, "]", "[", 4, 5, 6, "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 2);
        REQUIRE(result.ok()[0] == Voice<int>{Voice<int>{1, 2, 3}});
        REQUIRE(result.ok()[1] == Voice<int>{Voice<int>{4, 5, 6}});
    }

    SECTION("Single-element nested list") {
        atoms atms{"[", "[", 1, "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == Voice<int>{Voice<int>{1}});
    }


    SECTION("Empty nested list") {
        atoms atms{"[", "[", "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0].empty());
    }

    SECTION("Single null") {
        atoms atms{"null"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->is_empty_like());
    }

    SECTION("Multiple null") {
        atoms atms{"null", "null", "null"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0].empty());
        REQUIRE(result.ok()[1].empty());
        REQUIRE(result.ok()[2].empty());
    }

    SECTION("Null/value mix") {
        atoms atms{"null", 1, "null"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0].empty());
        REQUIRE(result.ok()[1] == Voice<int>{1});
        REQUIRE(result.ok()[2].empty());
    }

    SECTION("Nested null") {
        atoms atms{"[", "null", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->is_empty_like());
    }

    SECTION("Nested multiple null") {
        atoms atms{"[", "null", "null", "null", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0].empty());
        REQUIRE(result.ok()[1].empty());
        REQUIRE(result.ok()[2].empty());
    }

    SECTION("Invalid null usage") {
        atoms atms{"[", "[", "null", "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Missing ending bracket") {
        atoms atms{"[", 1, 2, 3}; // [ 1 2 3
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Missing opening bracket") {
        atoms atms{1, 2, 3, "]"}; // 1 2 3 ]
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Missing nested ending bracket") {
        atoms atms{"[", "[", 1, 2, 3, "]"}; // [ [ 1 2 3 ]
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Missing inner bracket") {
        atoms atms{"[", 1, 2, 3, "]", 4, 5, 6, "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Three-levels nested list") {
        atoms atms{"[", "[", "[", 1, 2, 3, "]", "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("Premature end") {
        atoms atms{"[", "[", 1, 2, 3};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
    }

    SECTION("With stripped initial bracket") {
        // First symbol of input is typically stripped due to attribute<>/message<> parsing
        atoms atms{1, 2, 3, "]"};

        SECTION("Parsing without bracket") {
            auto result = AtomParser::atoms2voices<int>(atms, true);
            REQUIRE(result.is_ok());
            REQUIRE(result->size() == 3);
            REQUIRE(result.ok()[0] == Voice<int>{1});
            REQUIRE(result.ok()[1] == Voice<int>{2});
            REQUIRE(result.ok()[2] == Voice<int>{3});
        }

        SECTION("Parsing with bracket re-prepended") {
            auto atms_formatted = AtomParser::prepend_leading_bracket(atms);
            auto result = AtomParser::atoms2voices<int>(atms_formatted, false);
            REQUIRE(result.is_ok());
            REQUIRE(result->size() == 3);
            REQUIRE(result.ok()[0] == Voice<int>{1});
            REQUIRE(result.ok()[1] == Voice<int>{2});
            REQUIRE(result.ok()[2] == Voice<int>{3});
        }
    }

    SECTION("Simple list without outer brackets") {
        atoms atms{1, 2, 3};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0] == Voice<int>{1});
        REQUIRE(result.ok()[1] == Voice<int>{2});
        REQUIRE(result.ok()[2] == Voice<int>{3});
    }

    SECTION("Nested list without outer brackets") {
        atoms atms{1, "[", 2, 3, "]", 4};
    }
}

TEST_CASE("Parsing Symbolic Lists of lists (Voices)", "[shared_code]") {
    SECTION("Simple List") {
        atoms atms{"[", "a", "abc", "def", "]"};
        auto result = AtomParser::atoms2voices<std::string>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0] == Voice<std::string>{"a"});
        REQUIRE(result.ok()[1] == Voice<std::string>{"abc"});
        REQUIRE(result.ok()[2] == Voice<std::string>{"def"});
    }

    // TODO: This should maybe fail (!result.ok())
    SECTION("Wrong input type (number to string)") {
        atoms atms{"[", 1, 2, 3, "]"};
        auto result = AtomParser::atoms2voices<std::string>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result.ok()[0] == Voice<std::string>{"1"});
        REQUIRE(result.ok()[1] == Voice<std::string>{"2"});
        REQUIRE(result.ok()[2] == Voice<std::string>{"3"});
    }

    // TODO: This should definitely not be ok()
//    SECTION("Wrong input type (string to number)") {
//        atoms atms{"[", "a", "b", "c", "]"};
//        auto result = AtomParser::atoms2voices<int>(atms);
//        result.ok().print();
//        REQUIRE(!result.is_ok());
//    }

}