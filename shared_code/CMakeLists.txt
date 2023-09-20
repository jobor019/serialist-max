add_library(sharedCode
        INTERFACE
        parsing.h
        result.h)

target_include_directories(sharedCode INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})