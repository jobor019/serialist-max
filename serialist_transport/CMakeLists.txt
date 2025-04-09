
add_library(serialist_transport
        SHARED # We need to compile this as a shared library to ensure that the singleton can be used by any module
        ${CMAKE_CURRENT_SOURCE_DIR}/serialist_transport.cpp
)

target_link_libraries(serialist_transport
        PUBLIC
        serialist::core
)


target_include_directories(serialist_transport PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

set_target_properties(serialist_transport PROPERTIES
    MACOSX_RPATH ON
    INSTALL_NAME_DIR "@rpath"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/support"
)

target_compile_definitions(serialist_transport PUBLIC SERIALIST_EPSILON=1e-6)