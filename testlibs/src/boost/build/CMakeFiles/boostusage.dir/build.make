# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.23.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.23.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/bsl/zf/workspaces/testlibs/src/boost

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/bsl/zf/workspaces/testlibs/src/boost/build

# Include any dependencies generated for this target.
include CMakeFiles/boostusage.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/boostusage.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/boostusage.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/boostusage.dir/flags.make

CMakeFiles/boostusage.dir/boosttest.cpp.o: CMakeFiles/boostusage.dir/flags.make
CMakeFiles/boostusage.dir/boosttest.cpp.o: ../boosttest.cpp
CMakeFiles/boostusage.dir/boosttest.cpp.o: CMakeFiles/boostusage.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bsl/zf/workspaces/testlibs/src/boost/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/boostusage.dir/boosttest.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/boostusage.dir/boosttest.cpp.o -MF CMakeFiles/boostusage.dir/boosttest.cpp.o.d -o CMakeFiles/boostusage.dir/boosttest.cpp.o -c /Users/bsl/zf/workspaces/testlibs/src/boost/boosttest.cpp

CMakeFiles/boostusage.dir/boosttest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/boostusage.dir/boosttest.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/bsl/zf/workspaces/testlibs/src/boost/boosttest.cpp > CMakeFiles/boostusage.dir/boosttest.cpp.i

CMakeFiles/boostusage.dir/boosttest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/boostusage.dir/boosttest.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/bsl/zf/workspaces/testlibs/src/boost/boosttest.cpp -o CMakeFiles/boostusage.dir/boosttest.cpp.s

CMakeFiles/boostusage.dir/main.cpp.o: CMakeFiles/boostusage.dir/flags.make
CMakeFiles/boostusage.dir/main.cpp.o: ../main.cpp
CMakeFiles/boostusage.dir/main.cpp.o: CMakeFiles/boostusage.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/bsl/zf/workspaces/testlibs/src/boost/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/boostusage.dir/main.cpp.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/boostusage.dir/main.cpp.o -MF CMakeFiles/boostusage.dir/main.cpp.o.d -o CMakeFiles/boostusage.dir/main.cpp.o -c /Users/bsl/zf/workspaces/testlibs/src/boost/main.cpp

CMakeFiles/boostusage.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/boostusage.dir/main.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/bsl/zf/workspaces/testlibs/src/boost/main.cpp > CMakeFiles/boostusage.dir/main.cpp.i

CMakeFiles/boostusage.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/boostusage.dir/main.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/bsl/zf/workspaces/testlibs/src/boost/main.cpp -o CMakeFiles/boostusage.dir/main.cpp.s

# Object files for target boostusage
boostusage_OBJECTS = \
"CMakeFiles/boostusage.dir/boosttest.cpp.o" \
"CMakeFiles/boostusage.dir/main.cpp.o"

# External object files for target boostusage
boostusage_EXTERNAL_OBJECTS =

boostusage: CMakeFiles/boostusage.dir/boosttest.cpp.o
boostusage: CMakeFiles/boostusage.dir/main.cpp.o
boostusage: CMakeFiles/boostusage.dir/build.make
boostusage: CMakeFiles/boostusage.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/bsl/zf/workspaces/testlibs/src/boost/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable boostusage"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/boostusage.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/boostusage.dir/build: boostusage
.PHONY : CMakeFiles/boostusage.dir/build

CMakeFiles/boostusage.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/boostusage.dir/cmake_clean.cmake
.PHONY : CMakeFiles/boostusage.dir/clean

CMakeFiles/boostusage.dir/depend:
	cd /Users/bsl/zf/workspaces/testlibs/src/boost/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/bsl/zf/workspaces/testlibs/src/boost /Users/bsl/zf/workspaces/testlibs/src/boost /Users/bsl/zf/workspaces/testlibs/src/boost/build /Users/bsl/zf/workspaces/testlibs/src/boost/build /Users/bsl/zf/workspaces/testlibs/src/boost/build/CMakeFiles/boostusage.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/boostusage.dir/depend

