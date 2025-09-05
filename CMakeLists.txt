cmake_minimum_required(VERSION 3.19)
SET(CMAKE_CXX_STANDARD 17)
project(serialistMax)


set(CMAKE_OSX_ARCHITECTURES arm64;x86_64)

# Option to build with local symlink in order to simplify lock-step development and access uncommitted changes
option(SERIALIST_LOCAL_SYMLINK OFF "Build with local symlink to serialist in libs/serialist-symlink")

if (SERIALIST_LOCAL_SYMLINK)
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/libs/serialist-symlink)
        message(FATAL_ERROR "libs/serialist-symlink does not exist, create the symlink or remove the SERIALIST_LOCAL_SYMLINK option")
    endif()
    message(STATUS "Building with local symlink to serialist in libs/serialist-symlink")
    add_subdirectory(libs/serialist-symlink)
else()
    add_subdirectory(libs/serialist)
endif()

add_subdirectory(shared_code)

include(${CMAKE_SOURCE_DIR}/min-api/script/min-package.cmake)

set(C74_MIN_API_DIR ${CMAKE_SOURCE_DIR}/min-api)
set(C74_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/externals)


add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.chordthresh)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.index)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.interpolate)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.lowpass)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.makenote)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.multilist)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.op)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.phase)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.pattern)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.phasemap)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.playground)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.pulse)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.pulsefilter)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.random)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.router)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.scale)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.slidermapping)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.snh)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.transport)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.util)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/ser.waveform)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/serialist_transport)


add_custom_target(all_externals)
add_dependencies(all_externals
        ser.chordthresh
        ser.index
        ser.interpolate
        ser.lowpass
        ser.scale
        ser.makenote
        ser.multilist
        ser.op
        ser.pattern
        ser.phase
        ser.phasemap
        ser.playground
        ser.pulse
        ser.pulsefilter
        ser.random
        ser.router
        ser.slidermapping
        ser.snh
        ser.transport
        ser.util
        ser.waveform
)


# Override settings from min-api for C++17 support
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.13" CACHE STRING "Minimum OS X deployment version" FORCE)
message(STATUS "MacOS deployment target: ${CMAKE_OSX_DEPLOYMENT_TARGET}")
