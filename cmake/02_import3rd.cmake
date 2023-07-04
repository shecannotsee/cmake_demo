# All third party list.
set(all_third_party
        "googletest")

# A library that can use universal compilation methods
set(auto_third_party
        "googletest")


# Traverse list to build auto_third_party
foreach(item IN LISTS auto_third_party)
    message("Compiling: ${item}")
    if (NOT EXISTS "${CMAKE_SOURCE_DIR}/${item}")
        # 指定cmake_test依赖于glog
        message(STATUS "Need to compile third-party libraries:glog.")
        # 如果库不存在，就编译第三方库
        ExternalProject_Add(
                glog
                # 指定源码
                SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/${item}"
                # 指定cmake的安装目录
                CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_SOURCE_DIR}/third_party/${item}-install
        )
    else()
        message(STATUS "Glog does not need to be compiled again.")
    endif()

endforeach()
