#include <catch2/catch_test_macros.hpp>
//#include <catch2/matchers/catch_matchers_floating_point.hpp>

// TODO: List of list parsing tests: need to be adapted to c74::min::atoms
//TEST_CASE("Parsing Lists") {
//    SECTION("Test Case 1: Simple List") {
//        std::vector<std::string> input = {"1", "2", "3", "]"};
//        std::vector<std::vector<std::string>> result = parse(input);
//
//        REQUIRE(result.size() == 3);
//        REQUIRE(result[0] == std::vector<std::string>{"1"});
//        REQUIRE(result[1] == std::vector<std::string>{"2"});
//        REQUIRE(result[2] == std::vector<std::string>{"3"});
//    }
//
//    SECTION("Test Case 1: Simple List (2)") {
//        std::vector<std::string> input = {"[", "1","]", "[", "2", "]", "[","3", "]", "]"};
//        std::vector<std::vector<std::string>> result = parse(input);
//
//        REQUIRE(result.size() == 3);
//        REQUIRE(result[0] == std::vector<std::string>{"1"});
//        REQUIRE(result[1] == std::vector<std::string>{"2"});
//        REQUIRE(result[2] == std::vector<std::string>{"3"});
//    }
//
//    SECTION("Test Case 2: Nested Lists") {
//        std::vector<std::string> input = {"[", "1", "2", "]", "[", "3", "]", "]"};
//        std::vector<std::vector<std::string>> result = parse(input);
//
//        REQUIRE(result.size() == 2);
//        REQUIRE(result[0] == std::vector<std::string>{"1", "2"});
//        REQUIRE(result[1] == std::vector<std::string>{"3"});
//    }
//
//    SECTION("Test Case 3: Nested Lists with Single Element") {
//        std::vector<std::string> input = { "[", "1", "2", "]", "3", "]"};
//        std::vector<std::vector<std::string>> result = parse(input);
//
//        REQUIRE(result.size() == 2);
//        REQUIRE(result[0] == std::vector<std::string>{"1", "2"});
//        REQUIRE(result[1] == std::vector<std::string>{"3"});
//    }
//
//    SECTION("Test Case 4: Empty List") {
//        std::vector<std::string> input = {"]"};
//        std::vector<std::vector<std::string>> result = parse(input);
//
//        REQUIRE(result.empty());
//    }
//
//    SECTION("Test Case 5: Single Element Without Brackets") {
//        std::vector<std::string> input = {"1", "]"};
//        std::vector<std::vector<std::string>> result = parse(input);
//
//        REQUIRE(result.size() == 1);
//        REQUIRE(result[0] == std::vector<std::string>{"1"});
//    }
//
//
//
//    SECTION("Test Case 7: Lists of Lists of Lists") {
//        std::vector<std::string> input = {"[", "[", "1", "]", "2", "3", "]", "4", "]"};
//        REQUIRE_THROWS_AS(parse(input), std::out_of_range);
//    }
//
//    SECTION("Ill-formatted ending") {
//        std::vector<std::string> input = {"1", "2", "3"};
//        REQUIRE_THROWS_AS(parse(input), std::out_of_range);
//    }
//}

