# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/gajen/tuxmath

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/gajen/tuxmath/build_wsl

# Include any dependencies generated for this target.
include t4kcommon/CMakeFiles/t4k_common.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include t4kcommon/CMakeFiles/t4k_common.dir/compiler_depend.make

# Include the progress variables for this target.
include t4kcommon/CMakeFiles/t4k_common.dir/progress.make

# Include the compile flags for this target's objects.
include t4kcommon/CMakeFiles/t4k_common.dir/flags.make

t4kcommon/CMakeFiles/t4k_common.dir/codegen:
.PHONY : t4kcommon/CMakeFiles/t4k_common.dir/codegen

t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_common.c.o: t4kcommon/CMakeFiles/t4k_common.dir/flags.make
t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_common.c.o: /mnt/c/Users/gajen/tuxmath/t4kcommon/src/t4k_common.c
t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_common.c.o: t4kcommon/CMakeFiles/t4k_common.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/c/Users/gajen/tuxmath/build_wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_common.c.o"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_common.c.o -MF CMakeFiles/t4k_common.dir/src/t4k_common.c.o.d -o CMakeFiles/t4k_common.dir/src/t4k_common.c.o -c /mnt/c/Users/gajen/tuxmath/t4kcommon/src/t4k_common.c

t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_common.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/t4k_common.dir/src/t4k_common.c.i"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/c/Users/gajen/tuxmath/t4kcommon/src/t4k_common.c > CMakeFiles/t4k_common.dir/src/t4k_common.c.i

t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_common.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/t4k_common.dir/src/t4k_common.c.s"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/c/Users/gajen/tuxmath/t4kcommon/src/t4k_common.c -o CMakeFiles/t4k_common.dir/src/t4k_common.c.s

t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_loaders.c.o: t4kcommon/CMakeFiles/t4k_common.dir/flags.make
t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_loaders.c.o: /mnt/c/Users/gajen/tuxmath/t4kcommon/src/t4k_loaders.c
t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_loaders.c.o: t4kcommon/CMakeFiles/t4k_common.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/c/Users/gajen/tuxmath/build_wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_loaders.c.o"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_loaders.c.o -MF CMakeFiles/t4k_common.dir/src/t4k_loaders.c.o.d -o CMakeFiles/t4k_common.dir/src/t4k_loaders.c.o -c /mnt/c/Users/gajen/tuxmath/t4kcommon/src/t4k_loaders.c

t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_loaders.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/t4k_common.dir/src/t4k_loaders.c.i"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/c/Users/gajen/tuxmath/t4kcommon/src/t4k_loaders.c > CMakeFiles/t4k_common.dir/src/t4k_loaders.c.i

t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_loaders.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/t4k_common.dir/src/t4k_loaders.c.s"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/c/Users/gajen/tuxmath/t4kcommon/src/t4k_loaders.c -o CMakeFiles/t4k_common.dir/src/t4k_loaders.c.s

t4kcommon/CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.o: t4kcommon/CMakeFiles/t4k_common.dir/flags.make
t4kcommon/CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.o: /mnt/c/Users/gajen/tuxmath/t4kcommon/src/linebreak/linebreak.c
t4kcommon/CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.o: t4kcommon/CMakeFiles/t4k_common.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/c/Users/gajen/tuxmath/build_wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object t4kcommon/CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.o"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT t4kcommon/CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.o -MF CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.o.d -o CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.o -c /mnt/c/Users/gajen/tuxmath/t4kcommon/src/linebreak/linebreak.c

t4kcommon/CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.i"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/c/Users/gajen/tuxmath/t4kcommon/src/linebreak/linebreak.c > CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.i

t4kcommon/CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.s"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/c/Users/gajen/tuxmath/t4kcommon/src/linebreak/linebreak.c -o CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.s

# Object files for target t4k_common
t4k_common_OBJECTS = \
"CMakeFiles/t4k_common.dir/src/t4k_common.c.o" \
"CMakeFiles/t4k_common.dir/src/t4k_loaders.c.o" \
"CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.o"

# External object files for target t4k_common
t4k_common_EXTERNAL_OBJECTS =

t4kcommon/libt4k_common.a: t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_common.c.o
t4kcommon/libt4k_common.a: t4kcommon/CMakeFiles/t4k_common.dir/src/t4k_loaders.c.o
t4kcommon/libt4k_common.a: t4kcommon/CMakeFiles/t4k_common.dir/src/linebreak/linebreak.c.o
t4kcommon/libt4k_common.a: t4kcommon/CMakeFiles/t4k_common.dir/build.make
t4kcommon/libt4k_common.a: t4kcommon/CMakeFiles/t4k_common.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/mnt/c/Users/gajen/tuxmath/build_wsl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C static library libt4k_common.a"
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && $(CMAKE_COMMAND) -P CMakeFiles/t4k_common.dir/cmake_clean_target.cmake
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/t4k_common.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
t4kcommon/CMakeFiles/t4k_common.dir/build: t4kcommon/libt4k_common.a
.PHONY : t4kcommon/CMakeFiles/t4k_common.dir/build

t4kcommon/CMakeFiles/t4k_common.dir/clean:
	cd /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon && $(CMAKE_COMMAND) -P CMakeFiles/t4k_common.dir/cmake_clean.cmake
.PHONY : t4kcommon/CMakeFiles/t4k_common.dir/clean

t4kcommon/CMakeFiles/t4k_common.dir/depend:
	cd /mnt/c/Users/gajen/tuxmath/build_wsl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/gajen/tuxmath /mnt/c/Users/gajen/tuxmath/t4kcommon /mnt/c/Users/gajen/tuxmath/build_wsl /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon /mnt/c/Users/gajen/tuxmath/build_wsl/t4kcommon/CMakeFiles/t4k_common.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : t4kcommon/CMakeFiles/t4k_common.dir/depend

