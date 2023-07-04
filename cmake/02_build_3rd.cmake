# All third party list.
set(all_third_party
        "googletest")

# A library that can use universal compilation methods
set(auto_third_party
        "googletest")

# third party output
set(3rd_output)

# Traverse list to build auto_third_party
include(ExternalProject)
foreach(item IN LISTS auto_third_party)
    if (NOT EXISTS "${CMAKE_SOURCE_DIR}/third_party/${item}-install")
        message(STATUS "Need to compile third-party libraries:${item}.")
        # compliling
        ExternalProject_Add(
                ${item}
                # 指定源码
                SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/${item}"
                # 指定cmake的安装目录
                CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_SOURCE_DIR}/third_party/${item}-install
        )
        set(3rd_output ${3rd_output} ${CMAKE_SOURCE_DIR}/third_party/${item}-install)
    else()
        message(STATUS "${item} does not need to be compiled again.")
    endif()

endforeach()


