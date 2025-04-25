cmake_minimum_required(VERSION 3.19)
SET(CMAKE_CXX_STANDARD 17)
project(serialistMax)


set(CMAKE_OSX_ARCHITECTURES arm64;x86_64)

add_subdirectory(serialist)
add_subdirectory(shared_code)

include(${CMAKE_SOURCE_DIR}/min-api/script/min-package.cmake)

set(C74_MIN_API_DIR ${CMAKE_SOURCE_DIR}/min-api)
set(C74_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/externals)


add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.interpolator)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.makenote)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.op)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.oscillator)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.patternizer)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.phasemap)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.phasepulse)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.playground)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.pulsefilter)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.random)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.router)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.slidermapping)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.snh)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.transport)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.util)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.waveform)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/serialist_transport)


add_custom_target(all_externals)
add_dependencies(all_externals
#        ser.interpolator
        ser.makenote
        ser.op
#        ser.oscillator
        ser.patternizer
        ser.phasemap
        ser.phasepulse
        ser.playground
        ser.pulsefilter
        ser.random
        ser.router
        ser.slidermapping
        ser.snh
        ser.transport
        ser.util
)


# Override settings from min-api for C++17 support
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.13" CACHE STRING "Minimum OS X deployment version" FORCE)
message(STATUS "MacOS deployment target: ${CMAKE_OSX_DEPLOYMENT_TARGET}")
