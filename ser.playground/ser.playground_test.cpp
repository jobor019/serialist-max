
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
    REQUIRE(playground.mymessage(c74::min::atoms{1, 2, 3}, 0) == c74::min::atoms{1, 2, 3});


}


// ==============================================================================================
/**
 * Unit tests for shared code.
 * TODO Should ideally be moved to a separate file, but currently relies on a number of dependencies from c74::min
 *      and is therefore dependent on the c74::min cmake scripts as well as its modified catch2 framework at the moment
 */
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

enum class TestEnum {
    v0 = 0
    , v1 = 1
    , v2 = 2
    , v3 = 3
};

TEST_CASE("Parsing single atom") {
    SECTION("bool") {
        SECTION("parsing true") {
            c74::min::atom v{true};
            auto result = AtomParser::atom2value<bool>(v);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == true);
        }

        SECTION("parsing false") {
            c74::min::atom v{false};
            auto result = AtomParser::atom2value<bool>(v);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == false);
        }

        SECTION("bool from integral values") {
            c74::min::atom v1{1};
            auto result = AtomParser::atom2value<bool>(v1);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == true);

            c74::min::atom v2{0};
            result = AtomParser::atom2value<bool>(v2);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == false);

            c74::min::atom v3{1000};
            result = AtomParser::atom2value<bool>(v3);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == true);

            c74::min::atom v4{-1};
            result = AtomParser::atom2value<bool>(v4);
            REQUIRE(result.is_ok());
            REQUIRE(result.ok() == false);
        }

    }

    SECTION("integral") {
        c74::min::atom i1{1};
        auto result = AtomParser::atom2value<int>(i1);
        REQUIRE(result.is_ok());
        REQUIRE(result.ok() == 1);

        c74::min::atom i2{2};
        result = AtomParser::atom2value<int>(i2);
        REQUIRE(result.is_ok());
        REQUIRE(result.ok() == 2);
    }

    SECTION("null") {
        c74::min::atom v{"null"};
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

TEST_CASE("Parsing lists (Vec)") {
    SECTION("Simple list without brackets") {
        c74::min::atoms atms{1, 2, 3};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0] == 1);
        REQUIRE(result.ok()[1] == 2);
        REQUIRE(result.ok()[2] == 3);
    }

    SECTION("Simple list with brackets") {
        c74::min::atoms atms{"[", 1, 2, 3, "]"};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0] == 1);
        REQUIRE(result.ok()[1] == 2);
        REQUIRE(result.ok()[2] == 3);
    }

    SECTION("Empty list without brackets") {
        c74::min::atoms atms{"[", "]"};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->empty());
    }

    SECTION("Empty list with brackets") {
        c74::min::atoms atms;
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->empty());
    }

    SECTION("Single-element list without brackets") {
        c74::min::atoms atms{1};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == 1);

    }

    SECTION("Single-element list with brackets") {
        c74::min::atoms atms{"[", 1, "]"};
        auto result = AtomParser::atoms2vec<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 1);
        REQUIRE(result.ok()[0] == 1);
    }

    SECTION("List of lists") {
        c74::min::atoms atms{"[", "[", 1, 2, 3, "]", "]"};
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

TEST_CASE("Parsing Lists of lists (Voices)") {
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

    SECTION("Multiple nested lists") {
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

    SECTION("Single null") {
        c74::min::atoms atms{"null"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->is_empty_like());
    }

    SECTION("Multiple null") {
        c74::min::atoms atms{"null", "null", "null"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0].empty());
        REQUIRE(result.ok()[1].empty());
        REQUIRE(result.ok()[2].empty());
    }

    SECTION("Null/value mix") {
        c74::min::atoms atms{"null", 1, "null"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0].empty());
        REQUIRE(result.ok()[1] == Voice<int>{1});
        REQUIRE(result.ok()[2].empty());
    }

    SECTION("Nested null") {
        c74::min::atoms atms{"[", "null", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->is_empty_like());
    }

    SECTION("Nested multiple null") {
        c74::min::atoms atms{"[", "null", "null", "null", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(result.is_ok());
        REQUIRE(result->size() == 3);
        REQUIRE(result.ok()[0].empty());
        REQUIRE(result.ok()[1].empty());
        REQUIRE(result.ok()[2].empty());
    }

    SECTION("Invalid null usage") {
        c74::min::atoms atms{"[", "[", "null", "]", "]"};
        auto result = AtomParser::atoms2voices<int>(atms);
        REQUIRE(!result.is_ok());
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
        c74::min::atoms atms{1, 2, 3};
    }

    SECTION("Nested list without outer brackets") {
        c74::min::atoms atms{1, "[", 2, 3, "]", 4};
    }
}