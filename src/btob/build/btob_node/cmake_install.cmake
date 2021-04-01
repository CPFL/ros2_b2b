# Install script for directory: /home/saitama1/b2b_t/btob

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/saitama1/b2b_t/btob/install/btob_node")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/btob_node/listener" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/btob_node/listener")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/btob_node/listener"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/btob_node" TYPE EXECUTABLE FILES "/home/saitama1/b2b_t/btob/build/btob_node/listener")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/btob_node/listener" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/btob_node/listener")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/btob_node/listener"
         OLD_RPATH "/home/saitama1/ros2_foxy/install/rclcpp_components/lib:/home/saitama1/ros2_foxy/install/rclcpp/lib:/home/saitama1/ros2_foxy/install/libstatistics_collector/lib:/home/saitama1/ros2_foxy/install/std_msgs/lib:/home/saitama1/ros2_foxy/install/rcl/lib:/home/saitama1/ros2_foxy/install/rmw_implementation/lib:/home/saitama1/ros2_foxy/install/rmw/lib:/home/saitama1/ros2_foxy/install/rcl_logging_spdlog/lib:/home/saitama1/ros2_foxy/install/rcl_yaml_param_parser/lib:/home/saitama1/ros2_foxy/install/libyaml_vendor/lib:/home/saitama1/ros2_foxy/install/rosgraph_msgs/lib:/home/saitama1/ros2_foxy/install/statistics_msgs/lib:/home/saitama1/ros2_foxy/install/tracetools/lib:/home/saitama1/ros2_foxy/install/class_loader/lib:/home/saitama1/ros2_foxy/install/ament_index_cpp/lib:/home/saitama1/ros2_foxy/install/composition_interfaces/lib:/home/saitama1/ros2_foxy/install/rcl_interfaces/lib:/home/saitama1/ros2_foxy/install/builtin_interfaces/lib:/home/saitama1/ros2_foxy/install/rosidl_typesupport_c/lib:/home/saitama1/ros2_foxy/install/rosidl_typesupport_introspection_cpp/lib:/home/saitama1/ros2_foxy/install/rosidl_typesupport_introspection_c/lib:/home/saitama1/ros2_foxy/install/rosidl_typesupport_cpp/lib:/home/saitama1/ros2_foxy/install/rcpputils/lib:/home/saitama1/ros2_foxy/install/rosidl_runtime_c/lib:/home/saitama1/ros2_foxy/install/rcutils/lib:/opt/ros/foxy/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/btob_node/listener")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtopics_library.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtopics_library.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtopics_library.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/saitama1/b2b_t/btob/build/btob_node/libtopics_library.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtopics_library.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtopics_library.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtopics_library.so"
         OLD_RPATH "/home/saitama1/ros2_foxy/install/example_interfaces/lib:/home/saitama1/ros2_foxy/install/rclcpp_components/lib:/home/saitama1/adehome/AutowareAuto/install/autoware_auto_msgs/lib:/home/saitama1/ros2_foxy/install/rclcpp/lib:/home/saitama1/ros2_foxy/install/libstatistics_collector/lib:/home/saitama1/ros2_foxy/install/rcl/lib:/home/saitama1/ros2_foxy/install/rmw_implementation/lib:/home/saitama1/ros2_foxy/install/rmw/lib:/home/saitama1/ros2_foxy/install/rcl_logging_spdlog/lib:/home/saitama1/ros2_foxy/install/rcl_yaml_param_parser/lib:/home/saitama1/ros2_foxy/install/libyaml_vendor/lib:/home/saitama1/ros2_foxy/install/rosgraph_msgs/lib:/home/saitama1/ros2_foxy/install/statistics_msgs/lib:/home/saitama1/ros2_foxy/install/tracetools/lib:/home/saitama1/ros2_foxy/install/ament_index_cpp/lib:/home/saitama1/ros2_foxy/install/class_loader/lib:/home/saitama1/ros2_foxy/install/composition_interfaces/lib:/home/saitama1/ros2_foxy/install/rcl_interfaces/lib:/home/saitama1/ros2_foxy/install/action_msgs/lib:/home/saitama1/ros2_foxy/install/unique_identifier_msgs/lib:/home/saitama1/ros2_foxy/install/sensor_msgs/lib:/home/saitama1/ros2_foxy/install/geometry_msgs/lib:/home/saitama1/ros2_foxy/install/std_msgs/lib:/home/saitama1/ros2_foxy/install/builtin_interfaces/lib:/home/saitama1/ros2_foxy/install/rosidl_typesupport_c/lib:/home/saitama1/ros2_foxy/install/rosidl_typesupport_introspection_cpp/lib:/home/saitama1/ros2_foxy/install/rosidl_typesupport_introspection_c/lib:/home/saitama1/ros2_foxy/install/rosidl_typesupport_cpp/lib:/home/saitama1/ros2_foxy/install/rosidl_runtime_c/lib:/home/saitama1/ros2_foxy/install/rcpputils/lib:/home/saitama1/ros2_foxy/install/rcutils/lib:/opt/ros/foxy/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtopics_library.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node/" TYPE DIRECTORY FILES "")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/btob_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/btob_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node/environment" TYPE FILE FILES "/home/saitama1/ros2_foxy/install/ament_cmake_core/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node/environment" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node/environment" TYPE FILE FILES "/home/saitama1/ros2_foxy/install/ament_cmake_core/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node/environment" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_index/share/ament_index/resource_index/packages/btob_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/rclcpp_components" TYPE FILE FILES "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_index/share/ament_index/resource_index/rclcpp_components/btob_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node/cmake" TYPE FILE FILES
    "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_core/btob_nodeConfig.cmake"
    "/home/saitama1/b2b_t/btob/build/btob_node/ament_cmake_core/btob_nodeConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/btob_node" TYPE FILE FILES "/home/saitama1/b2b_t/btob/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/saitama1/b2b_t/btob/build/btob_node/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
