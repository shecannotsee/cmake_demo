# Traverse list to add auto_third_party
foreach(item IN LISTS 3rd_output)
    # include
    include_directories(${item}/include)
    # lib
    link_directories(${item}/lib)

    message("Item: ${item}")
endforeach()

include_directories(${CMAKE_SOURCE_DIR}/src)
include_directories(${CMAKE_SOURCE_DIR}/test)