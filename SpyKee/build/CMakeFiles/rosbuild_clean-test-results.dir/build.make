# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mikel/workspace/ros/PacBot/SpyKee

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mikel/workspace/ros/PacBot/SpyKee/build

# Utility rule file for rosbuild_clean-test-results.

# Include the progress variables for this target.
include CMakeFiles/rosbuild_clean-test-results.dir/progress.make

CMakeFiles/rosbuild_clean-test-results:
	if ! rm -rf /home/mikel/.ros/test_results/SpyKee; then echo WARNING:\ failed\ to\ remove\ test-results\ directory ; fi

rosbuild_clean-test-results: CMakeFiles/rosbuild_clean-test-results
rosbuild_clean-test-results: CMakeFiles/rosbuild_clean-test-results.dir/build.make
.PHONY : rosbuild_clean-test-results

# Rule to build all files generated by this target.
CMakeFiles/rosbuild_clean-test-results.dir/build: rosbuild_clean-test-results
.PHONY : CMakeFiles/rosbuild_clean-test-results.dir/build

CMakeFiles/rosbuild_clean-test-results.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/rosbuild_clean-test-results.dir/cmake_clean.cmake
.PHONY : CMakeFiles/rosbuild_clean-test-results.dir/clean

CMakeFiles/rosbuild_clean-test-results.dir/depend:
	cd /home/mikel/workspace/ros/PacBot/SpyKee/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mikel/workspace/ros/PacBot/SpyKee /home/mikel/workspace/ros/PacBot/SpyKee /home/mikel/workspace/ros/PacBot/SpyKee/build /home/mikel/workspace/ros/PacBot/SpyKee/build /home/mikel/workspace/ros/PacBot/SpyKee/build/CMakeFiles/rosbuild_clean-test-results.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/rosbuild_clean-test-results.dir/depend

