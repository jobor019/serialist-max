cmake_minimum_required(VERSION 3.19)
SET(CMAKE_CXX_STANDARD 17)
project(serialistMax)


set(CMAKE_OSX_ARCHITECTURES arm64;x86_64)

add_subdirectory(serialist)
add_subdirectory(shared_code)

include(${CMAKE_SOURCE_DIR}/min-api/script/min-package.cmake)

set(C74_MIN_API_DIR ${CMAKE_SOURCE_DIR}/min-api)
set(C74_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/externals)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.core.oscillator)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.core.phasepulse)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.core.makenote)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.core.interpolator)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.op)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.phasemap)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.playground)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.slidermapping)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.util)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/serialist_transport)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.core.transport)

add_custom_target(all_externals)
add_dependencies(all_externals
        ser.core.interpolator
        ser.core.makenote
        ser.core.oscillator
        ser.core.phasepulse
        ser.core.transport

        ser.phasemap
        ser.op
        ser.playground
        ser.slidermapping
        ser.util
)


# Override settings from min-api for C++17 support
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.13" CACHE STRING "Minimum OS X deployment version" FORCE)
message(STATUS "MacOS deployment target: ${CMAKE_OSX_DEPLOYMENT_TARGET}")
