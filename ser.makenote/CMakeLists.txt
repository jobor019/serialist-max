include(${C74_MIN_API_DIR}/script/min-package.cmake)
include(${C74_MIN_API_DIR}/script/min-pretarget.cmake)

include_directories("${C74_INCLUDES}")

# SOURCE_FILES must be defined for min-object-unittest.cmake
set(SOURCE_FILES ser.makenote.cpp)

# ${PROJECT_NAME} will here be name of current directory (thanks to min-pretarget.cmake)
add_library(${PROJECT_NAME} MODULE ${SOURCE_FILES})


target_link_libraries(${PROJECT_NAME}
        PUBLIC
        serialist_transport
        serialist::core
        shared_code)

include(${C74_MIN_API_DIR}/script/min-posttarget.cmake)

include(${C74_MIN_API_DIR}/test/min-object-unittest.cmake)

target_link_libraries(${TEST_NAME}
        PUBLIC
        serialist_transport
        serialist::core
        shared_code
)

target_compile_definitions(${PROJECT_NAME} PUBLIC SERIALIST_EPSILON=1e-6)
target_compile_definitions(${TEST_NAME} PUBLIC SERIALIST_EPSILON=1e-6)