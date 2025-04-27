# Locate SDL2_ttf library
# This module defines
# SDL2_TTF_LIBRARY, the name of the library to link against
# SDL2_TTF_FOUND, if false, do not try to link to SDL2_ttf
# SDL2_TTF_INCLUDE_DIR, where to find SDL_ttf.h

set(SDL2_TTF_PATH "${CMAKE_SOURCE_DIR}/deps/SDL2_ttf-2.22.0")

find_path(SDL2_TTF_INCLUDE_DIR SDL_ttf.h
    HINTS
    ${SDL2_TTF_PATH}/include
    PATHS
    /usr/include/SDL2
    /usr/local/include/SDL2
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    find_library(SDL2_TTF_LIBRARY
        NAMES SDL2_ttf
        HINTS
        ${SDL2_TTF_PATH}/lib/x64
        PATHS
        /usr/lib
        /usr/local/lib
        /usr/lib/x86_64-linux-gnu
    )
else()
    find_library(SDL2_TTF_LIBRARY
        NAMES SDL2_ttf
        HINTS
        ${SDL2_TTF_PATH}/lib/x86
        PATHS
        /usr/lib
        /usr/local/lib
        /usr/lib/i386-linux-gnu
    )
endif()

set(SDL2_TTF_LIBRARIES ${SDL2_TTF_LIBRARY})
set(SDL2_TTF_INCLUDE_DIRS ${SDL2_TTF_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(SDL2_ttf REQUIRED_VARS SDL2_TTF_LIBRARY SDL2_TTF_INCLUDE_DIR) 