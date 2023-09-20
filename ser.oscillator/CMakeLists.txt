include(${C74_MIN_API_DIR}/script/min-package.cmake)
include(${C74_MIN_API_DIR}/script/min-pretarget.cmake)

include_directories("${C74_INCLUDES}")

# ${PROJECT_NAME} will here be name of current directory (thanks to min-pretarget.cmake)
add_library(${PROJECT_NAME}
        MODULE
        ser.oscillator.cpp)

target_link_libraries(${PROJECT_NAME} PUBLIC serialistCore)
target_link_libraries(${PROJECT_NAME} PUBLIC sharedCode)


include(${C74_MIN_API_DIR}/script/min-posttarget.cmake)