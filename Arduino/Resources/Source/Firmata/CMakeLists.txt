cmake_minimum_required (VERSION 3.15)
  
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

project (ModelicaFirmata)

if ("${CMAKE_SIZEOF_VOID_P}" STREQUAL "8")
  set(PLATFORM win64)
else ()
  set(PLATFORM win32)
endif ()

add_library(ModelicaFirmata SHARED 
  FirmataConnection.cpp
  FirmataConnection.h
  ModelicaFirmata.cpp
  ModelicaFirmata.h
  serial.cpp
  serial.h
  ../../Include/ModelicaUtilityFunctions.c
  ../Arduino/ModelicaUtilities.cpp
)

target_compile_definitions(ModelicaFirmata PUBLIC
  WINDOWS
  _CRT_SECURE_NO_WARNINGS
)


#set_property(TARGET ModelicaFirmata PROPERTY
#  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

set_target_properties(ModelicaFirmata PROPERTIES PREFIX "")

target_include_directories(ModelicaFirmata PUBLIC
  .
  ../../Include
  ../../Sketches
  ../Arduino
)

add_custom_command(TARGET ModelicaFirmata POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy
  "$<TARGET_FILE:ModelicaFirmata>"
  "${CMAKE_CURRENT_SOURCE_DIR}/../../Library/${PLATFORM}"
)
