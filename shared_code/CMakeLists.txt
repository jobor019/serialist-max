add_library(shared_code
        INTERFACE
        max_timepoint.h
        parsing.h
        result.h
        max_stereotypes.h
        utils.h
        serialist_attributes.h
        save_state.h
        message_stereotypes.h)

target_include_directories(shared_code INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})