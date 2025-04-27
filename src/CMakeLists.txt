cmake_minimum_required(VERSION 3.10)

# Define project variables
set(TUXMATH_VERSION "2.0.4")
set(TUXMATHADMIN_VERSION "2.0.4")
set(TUXMATH_DATA_PREFIX "${CMAKE_INSTALL_PREFIX}/share/tuxmath")
set(LOCALE_DIR "${CMAKE_INSTALL_PREFIX}/share/locale")

# Find required packages
find_package(SDL2 REQUIRED)
find_package(SDL2_ttf REQUIRED)
find_package(SDL2_image REQUIRED)
find_package(SDL2_mixer REQUIRED)

# Define source files for TuxMath
set(TUXMATH_SOURCES
    ${CMAKE_SOURCE_DIR}/src/tuxmath.c
    ${CMAKE_SOURCE_DIR}/src/audio.c
    ${CMAKE_SOURCE_DIR}/src/campaign.c
    ${CMAKE_SOURCE_DIR}/src/comets.c
    ${CMAKE_SOURCE_DIR}/src/comets_graphics.c
    ${CMAKE_SOURCE_DIR}/src/credits.c
    ${CMAKE_SOURCE_DIR}/src/draw_utils.c
    ${CMAKE_SOURCE_DIR}/src/factoroids.c
    ${CMAKE_SOURCE_DIR}/src/factoroids_graphics.c
    ${CMAKE_SOURCE_DIR}/src/fileops.c
    ${CMAKE_SOURCE_DIR}/src/fileops_media.c
    ${CMAKE_SOURCE_DIR}/src/frame_counter.c
    ${CMAKE_SOURCE_DIR}/src/game.c
    ${CMAKE_SOURCE_DIR}/src/highscore.c
    ${CMAKE_SOURCE_DIR}/src/input.c
    ${CMAKE_SOURCE_DIR}/src/lessons.c
    ${CMAKE_SOURCE_DIR}/src/mathcards.c
    ${CMAKE_SOURCE_DIR}/src/menu.c
    ${CMAKE_SOURCE_DIR}/src/menu_lan.c
    ${CMAKE_SOURCE_DIR}/src/multiplayer.c
    ${CMAKE_SOURCE_DIR}/src/network.c
    ${CMAKE_SOURCE_DIR}/src/options.c
    ${CMAKE_SOURCE_DIR}/src/setup.c
    ${CMAKE_SOURCE_DIR}/src/titlescreen.c
    ${CMAKE_SOURCE_DIR}/src/validate.c
    ${CMAKE_SOURCE_DIR}/src/text_render.c
    ${CMAKE_SOURCE_DIR}/src/SDL_rotozoom.c
)

# Add executable
add_executable(tuxmath ${TUXMATH_SOURCES})

# Include directories
target_include_directories(tuxmath PRIVATE
    ${CMAKE_BINARY_DIR}
    ${SDL2_INCLUDE_DIRS}
    ${SDL2_IMAGE_INCLUDE_DIRS}
    ${SDL2_MIXER_INCLUDE_DIRS}
    ${SDL2_TTF_INCLUDE_DIRS}
    ${CMAKE_SOURCE_DIR}/src
    ${CMAKE_SOURCE_DIR}/t4kcommon/src
    ${CMAKE_SOURCE_DIR}/t4kcommon/src/linebreak
)

# Link libraries using consistent keyword style
target_link_libraries(tuxmath PRIVATE
    t4k_common
    ${SDL2_LIBRARIES}
    ${SDL2_IMAGE_LIBRARIES}
    ${SDL2_MIXER_LIBRARIES}
    ${SDL2_TTF_LIBRARIES}
    m
)

# tuxmathadmin sources
set(SOURCES_TUXMATHADMIN
    ${CMAKE_SOURCE_DIR}/src/tuxmathadmin.c
)

add_executable(tuxmathadmin ${SOURCES_TUXMATHADMIN})

# Link libraries for tuxmathadmin
target_link_libraries(tuxmathadmin PRIVATE
    t4k_common
    ${SDL2_LIBRARIES}
    ${SDL2_IMAGE_LIBRARIES}
    ${SDL2_MIXER_LIBRARIES}
    ${SDL2_TTF_LIBRARIES}
    m
)

# Set properties for tuxmath
set_target_properties(tuxmath PROPERTIES
    COMPILE_FLAGS "-DDATA_PREFIX=\\\"${TUXMATH_DATA_PREFIX}\\\" -DVERSION=\\\"${TUXMATH_VERSION}\\\" -DLOCALEDIR=\\\"${LOCALE_DIR}\\\" -DPACKAGE=\\\"tuxmath\\\" -DHAVE_SCANDIR"
)

# Set properties for tuxmathadmin
set_target_properties(tuxmathadmin PROPERTIES
    COMPILE_FLAGS "-DDATA_PREFIX=\\\"${TUXMATH_DATA_PREFIX}\\\" -DVERSION=\\\"${TUXMATHADMIN_VERSION}\\\" -DLOCALEDIR=\\\"${LOCALE_DIR}\\\" -DPACKAGE=\\\"tuxmathadmin\\\""
)

# Windows-specific libraries
if(WIN32)
    target_link_libraries(tuxmath PRIVATE
        winmm
        version
        imm32
    )
endif()

# Unix-specific libraries
if(UNIX AND NOT APPLE)
    target_link_libraries(tuxmath PRIVATE m)
endif()

# Installation rules
install(TARGETS tuxmath tuxmathadmin
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)
