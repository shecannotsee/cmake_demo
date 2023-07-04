# source file
file(GLOB_RECURSE TEST_SRC "${CMAKE_SOURCE_DIR}/test/*")
# list(REMOVE_ITEM SRC "${CMAKE_SOURCE_DIR}/src/TaskControl.cpp") # Exclude specific files

set(test_name "${project_name}_test")

# test target
add_executable(${test_name} ${TEST_SRC} ${SRC})
target_link_libraries(${test_name} ${lib})
