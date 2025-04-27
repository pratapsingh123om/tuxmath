# Locate SDL2_image library
# This module defines
# SDL2_IMAGE_LIBRARY, the name of the library to link against
# SDL2_IMAGE_FOUND, if false, do not try to link to SDL2_image
# SDL2_IMAGE_INCLUDE_DIR, where to find SDL_image.h

set(SDL2_IMAGE_PATH "${CMAKE_SOURCE_DIR}/deps/SDL2_image-2.8.2")

find_path(SDL2_IMAGE_INCLUDE_DIR SDL_image.h
    HINTS
    ${SDL2_IMAGE_PATH}/include
    PATHS
    /usr/include/SDL2
    /usr/local/include/SDL2
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    find_library(SDL2_IMAGE_LIBRARY
        NAMES SDL2_image
        HINTS
        ${SDL2_IMAGE_PATH}/lib/x64
        PATHS
        /usr/lib
        /usr/local/lib
        /usr/lib/x86_64-linux-gnu
    )
else()
    find_library(SDL2_IMAGE_LIBRARY
        NAMES SDL2_image
        HINTS
        ${SDL2_IMAGE_PATH}/lib/x86
        PATHS
        /usr/lib
        /usr/local/lib
        /usr/lib/i386-linux-gnu
    )
endif()

set(SDL2_IMAGE_LIBRARIES ${SDL2_IMAGE_LIBRARY})
set(SDL2_IMAGE_INCLUDE_DIRS ${SDL2_IMAGE_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(SDL2_image REQUIRED_VARS SDL2_IMAGE_LIBRARY SDL2_IMAGE_INCLUDE_DIR) 