# source src
file(GLOB_RECURSE SRC "${CMAKE_SOURCE_DIR}/src/*")
# list(REMOVE_ITEM SRC "${CMAKE_SOURCE_DIR}/src/TaskControl.cpp") # Exclude specific files

# ld lib
set(lib "-pthread"
        "-lgtest"
        "-lgmock"
        "-lglog")


# exe target
if (project_type STREQUAL "executable")
    add_executable(${PROJECT_NAME} ${SRC})
    target_link_libraries(${PROJECT_NAME} ${lib})
    message(STATUS "This is an executable program")
else()
    message(STATUS "CMakeLists.txt error:target error")
endif ()

# lib target
if (project_type STREQUAL "library")
    set(library_static_name "${project_name}_static")
    add_library(${library_static_name} STATIC ${SRC})
    # Rename the generated static library
    set_target_properties(${library_static_name} PROPERTIES OUTPUT_NAME ${project_name})

#    set(library_dynamic_name "${project_name}_dynamic")
#    add_library(${library_dynamic_name} SHARED ${SRC})
#    # Rename the generated dynamic library
#    set_target_properties(${library_dynamic_name} PROPERTIES OUTPUT_NAME ${project_name})
else()
    message(STATUS "CMakeLists.txt error:target error")
endif ()
