add_library(sharedCode
        INTERFACE
        max_timepoint.h
        parsing.h
        result.h
        max_stereotypes.h
        utils.h)

target_include_directories(sharedCode INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})