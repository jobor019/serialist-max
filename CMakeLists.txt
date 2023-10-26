cmake_minimum_required(VERSION 3.19)
SET(CMAKE_CXX_STANDARD 17)
project(serialistMax)


set(CMAKE_OSX_ARCHITECTURES arm64;x86_64)

add_subdirectory(serialist-looper)
add_subdirectory(shared_code)

include(${CMAKE_SOURCE_DIR}/min-api/script/min-package.cmake)

set(C74_MIN_API_DIR ${CMAKE_SOURCE_DIR}/min-api)
set(C74_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/externals)

add_subdirectory(ser.oscillator)
add_subdirectory(ser.randpulse)
add_subdirectory(ser.allocator)
add_subdirectory(ser.playground)


# Override settings from min-api for C++17 support
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.13" CACHE STRING "Minimum OS X deployment version" FORCE)
message(STATUS "MacOS deployment target: ${CMAKE_OSX_DEPLOYMENT_TARGET}")


#####################################################################################
## TESTS
#####################################################################################

find_package(Catch2 3 REQUIRED)


add_executable(maxTests EXCLUDE_FROM_ALL
        ${CMAKE_CURRENT_SOURCE_DIR}/test/cpp/parsing_tests.cpp
)

target_link_libraries(maxTests PUBLIC
        serialistCore
        sharedCode
        Catch2::Catch2WithMain
)

if (Catch2_FOUND)
    message("found")
else()
    message("not found")
endif()
