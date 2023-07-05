
include(ExternalProject)
if (NOT EXISTS "${CMAKE_SOURCE_DIR}/third_party/googletest-install")
    message(STATUS "Need to compile third-party libraries:googletest.")
    # compliling
    ExternalProject_Add(
            googletest
            # 指定源码
            SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party/googletest"
            # 指定cmake的安装目录
            CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_SOURCE_DIR}/third_party/googletest-install
    )
else()
    message(STATUS "googletest does not need to be compiled again.")
endif()



