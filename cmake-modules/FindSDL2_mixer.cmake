# Locate SDL2_mixer library
# This module defines
# SDL2_MIXER_LIBRARY, the name of the library to link against
# SDL2_MIXER_FOUND, if false, do not try to link to SDL2_mixer
# SDL2_MIXER_INCLUDE_DIR, where to find SDL_mixer.h

set(SDL2_MIXER_PATH "${CMAKE_SOURCE_DIR}/deps/SDL2_mixer-2.8.0")

find_path(SDL2_MIXER_INCLUDE_DIR SDL_mixer.h
    HINTS
    ${SDL2_MIXER_PATH}/include
    PATHS
    /usr/include/SDL2
    /usr/local/include/SDL2
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    find_library(SDL2_MIXER_LIBRARY
        NAMES SDL2_mixer
        HINTS
        ${SDL2_MIXER_PATH}/lib/x64
        PATHS
        /usr/lib
        /usr/local/lib
        /usr/lib/x86_64-linux-gnu
    )
else()
    find_library(SDL2_MIXER_LIBRARY
        NAMES SDL2_mixer
        HINTS
        ${SDL2_MIXER_PATH}/lib/x86
        PATHS
        /usr/lib
        /usr/local/lib
        /usr/lib/i386-linux-gnu
    )
endif()

set(SDL2_MIXER_LIBRARIES ${SDL2_MIXER_LIBRARY})
set(SDL2_MIXER_INCLUDE_DIRS ${SDL2_MIXER_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(SDL2_mixer REQUIRED_VARS SDL2_MIXER_LIBRARY SDL2_MIXER_INCLUDE_DIR) 