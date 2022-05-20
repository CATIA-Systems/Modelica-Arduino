cmake_minimum_required (VERSION 3.15)

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

project (Arduino)

if ("${CMAKE_SIZEOF_VOID_P}" STREQUAL "8")
  set(PLATFORM win64)
else ()
  set(PLATFORM win32)
endif ()

file(GLOB SRC_FILES *.h *.cpp)

add_library(ModelicaArduino SHARED ${SRC_FILES})

target_compile_definitions(ModelicaArduino PUBLIC
  ARDUINO=100
)

SET_TARGET_PROPERTIES(ModelicaArduino PROPERTIES PREFIX "")

target_include_directories(ModelicaArduino PUBLIC
  .
  ../../Include
  ../../Sketches
)

add_custom_command(TARGET ModelicaArduino POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy
  "$<TARGET_FILE:ModelicaArduino>"
  "${CMAKE_CURRENT_SOURCE_DIR}/../../Library/${PLATFORM}"
)
