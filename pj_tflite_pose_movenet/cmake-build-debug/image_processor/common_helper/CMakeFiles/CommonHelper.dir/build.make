# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /home/tabaluga/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/221.5080.224/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/tabaluga/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/221.5080.224/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug

# Include any dependencies generated for this target.
include image_processor/common_helper/CMakeFiles/CommonHelper.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include image_processor/common_helper/CMakeFiles/CommonHelper.dir/compiler_depend.make

# Include the progress variables for this target.
include image_processor/common_helper/CMakeFiles/CommonHelper.dir/progress.make

# Include the compile flags for this target's objects.
include image_processor/common_helper/CMakeFiles/CommonHelper.dir/flags.make

image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper.cpp.o: image_processor/common_helper/CMakeFiles/CommonHelper.dir/flags.make
image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper.cpp.o: /home/tabaluga/CLionProjects/play_with_tflite/common_helper/common_helper.cpp
image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper.cpp.o: image_processor/common_helper/CMakeFiles/CommonHelper.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper.cpp.o"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper.cpp.o -MF CMakeFiles/CommonHelper.dir/common_helper.cpp.o.d -o CMakeFiles/CommonHelper.dir/common_helper.cpp.o -c /home/tabaluga/CLionProjects/play_with_tflite/common_helper/common_helper.cpp

image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CommonHelper.dir/common_helper.cpp.i"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tabaluga/CLionProjects/play_with_tflite/common_helper/common_helper.cpp > CMakeFiles/CommonHelper.dir/common_helper.cpp.i

image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CommonHelper.dir/common_helper.cpp.s"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tabaluga/CLionProjects/play_with_tflite/common_helper/common_helper.cpp -o CMakeFiles/CommonHelper.dir/common_helper.cpp.s

image_processor/common_helper/CMakeFiles/CommonHelper.dir/bounding_box.cpp.o: image_processor/common_helper/CMakeFiles/CommonHelper.dir/flags.make
image_processor/common_helper/CMakeFiles/CommonHelper.dir/bounding_box.cpp.o: /home/tabaluga/CLionProjects/play_with_tflite/common_helper/bounding_box.cpp
image_processor/common_helper/CMakeFiles/CommonHelper.dir/bounding_box.cpp.o: image_processor/common_helper/CMakeFiles/CommonHelper.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object image_processor/common_helper/CMakeFiles/CommonHelper.dir/bounding_box.cpp.o"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT image_processor/common_helper/CMakeFiles/CommonHelper.dir/bounding_box.cpp.o -MF CMakeFiles/CommonHelper.dir/bounding_box.cpp.o.d -o CMakeFiles/CommonHelper.dir/bounding_box.cpp.o -c /home/tabaluga/CLionProjects/play_with_tflite/common_helper/bounding_box.cpp

image_processor/common_helper/CMakeFiles/CommonHelper.dir/bounding_box.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CommonHelper.dir/bounding_box.cpp.i"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tabaluga/CLionProjects/play_with_tflite/common_helper/bounding_box.cpp > CMakeFiles/CommonHelper.dir/bounding_box.cpp.i

image_processor/common_helper/CMakeFiles/CommonHelper.dir/bounding_box.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CommonHelper.dir/bounding_box.cpp.s"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tabaluga/CLionProjects/play_with_tflite/common_helper/bounding_box.cpp -o CMakeFiles/CommonHelper.dir/bounding_box.cpp.s

image_processor/common_helper/CMakeFiles/CommonHelper.dir/tracker.cpp.o: image_processor/common_helper/CMakeFiles/CommonHelper.dir/flags.make
image_processor/common_helper/CMakeFiles/CommonHelper.dir/tracker.cpp.o: /home/tabaluga/CLionProjects/play_with_tflite/common_helper/tracker.cpp
image_processor/common_helper/CMakeFiles/CommonHelper.dir/tracker.cpp.o: image_processor/common_helper/CMakeFiles/CommonHelper.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object image_processor/common_helper/CMakeFiles/CommonHelper.dir/tracker.cpp.o"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT image_processor/common_helper/CMakeFiles/CommonHelper.dir/tracker.cpp.o -MF CMakeFiles/CommonHelper.dir/tracker.cpp.o.d -o CMakeFiles/CommonHelper.dir/tracker.cpp.o -c /home/tabaluga/CLionProjects/play_with_tflite/common_helper/tracker.cpp

image_processor/common_helper/CMakeFiles/CommonHelper.dir/tracker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CommonHelper.dir/tracker.cpp.i"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tabaluga/CLionProjects/play_with_tflite/common_helper/tracker.cpp > CMakeFiles/CommonHelper.dir/tracker.cpp.i

image_processor/common_helper/CMakeFiles/CommonHelper.dir/tracker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CommonHelper.dir/tracker.cpp.s"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tabaluga/CLionProjects/play_with_tflite/common_helper/tracker.cpp -o CMakeFiles/CommonHelper.dir/tracker.cpp.s

image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.o: image_processor/common_helper/CMakeFiles/CommonHelper.dir/flags.make
image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.o: /home/tabaluga/CLionProjects/play_with_tflite/common_helper/common_helper_cv.cpp
image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.o: image_processor/common_helper/CMakeFiles/CommonHelper.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.o"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.o -MF CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.o.d -o CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.o -c /home/tabaluga/CLionProjects/play_with_tflite/common_helper/common_helper_cv.cpp

image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.i"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tabaluga/CLionProjects/play_with_tflite/common_helper/common_helper_cv.cpp > CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.i

image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.s"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tabaluga/CLionProjects/play_with_tflite/common_helper/common_helper_cv.cpp -o CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.s

# Object files for target CommonHelper
CommonHelper_OBJECTS = \
"CMakeFiles/CommonHelper.dir/common_helper.cpp.o" \
"CMakeFiles/CommonHelper.dir/bounding_box.cpp.o" \
"CMakeFiles/CommonHelper.dir/tracker.cpp.o" \
"CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.o"

# External object files for target CommonHelper
CommonHelper_EXTERNAL_OBJECTS =

image_processor/common_helper/libCommonHelper.a: image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper.cpp.o
image_processor/common_helper/libCommonHelper.a: image_processor/common_helper/CMakeFiles/CommonHelper.dir/bounding_box.cpp.o
image_processor/common_helper/libCommonHelper.a: image_processor/common_helper/CMakeFiles/CommonHelper.dir/tracker.cpp.o
image_processor/common_helper/libCommonHelper.a: image_processor/common_helper/CMakeFiles/CommonHelper.dir/common_helper_cv.cpp.o
image_processor/common_helper/libCommonHelper.a: image_processor/common_helper/CMakeFiles/CommonHelper.dir/build.make
image_processor/common_helper/libCommonHelper.a: image_processor/common_helper/CMakeFiles/CommonHelper.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libCommonHelper.a"
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && $(CMAKE_COMMAND) -P CMakeFiles/CommonHelper.dir/cmake_clean_target.cmake
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CommonHelper.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
image_processor/common_helper/CMakeFiles/CommonHelper.dir/build: image_processor/common_helper/libCommonHelper.a
.PHONY : image_processor/common_helper/CMakeFiles/CommonHelper.dir/build

image_processor/common_helper/CMakeFiles/CommonHelper.dir/clean:
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper && $(CMAKE_COMMAND) -P CMakeFiles/CommonHelper.dir/cmake_clean.cmake
.PHONY : image_processor/common_helper/CMakeFiles/CommonHelper.dir/clean

image_processor/common_helper/CMakeFiles/CommonHelper.dir/depend:
	cd /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet /home/tabaluga/CLionProjects/play_with_tflite/common_helper /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper /home/tabaluga/CLionProjects/play_with_tflite/pj_tflite_pose_movenet/cmake-build-debug/image_processor/common_helper/CMakeFiles/CommonHelper.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : image_processor/common_helper/CMakeFiles/CommonHelper.dir/depend

