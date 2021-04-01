cmake_minimum_required(VERSION 3.5)

project(btob_node)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

#TODO:demo_nodes_cppのCMakeListsから引用しているため不要な行があるので必要なものを整理


find_package(ament_cmake REQUIRED)
find_package(example_interfaces REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rclcpp_components REQUIRED)
find_package(rcutils)
find_package(rmw REQUIRED)
find_package(std_msgs REQUIRED)
find_package(ament_cmake_auto REQUIRED)
find_package(autoware_auto_msgs REQUIRED)

ament_auto_find_build_dependencies()


include_directories(
  include
  ../install
)

function(target)
  add_executable(${target} src/${target}.cpp)
  ament_target_dependencies(${target}
    "example_interfaces"
    "rclcpp"
    "rcutils"
    "std_msgs"
    "autoware_auto_msgs")
  install(TARGETS ${target}
  DESTINATION lib/${PROJECT_NAME})
endfunction()

function(add_demo_dependencies library)
  target_compile_definitions(${library}
    PRIVATE "DEMO_NODES_CPP_BUILDING_DLL")
  ament_target_dependencies(${library}
    "example_interfaces"
    "rclcpp"
    "rclcpp_components"
    "rcutils"
    "std_msgs"
    "autoware_auto_msgs")
endfunction()
# Tutorials of Publish/Subscribe with Topics
#custom_executable(topics allocator_tutorial)

# Tutorials of Request/Response with Services
#custom_executable(services add_two_ints_client)

# Tutorials of Parameters with Asynchronous and Synchronous
#custom_executable(parameters list_parameters_async)
#custom_executable(parameters parameter_events)
#custom_executable(parameters set_and_get_parameters_async)

add_library(topics_library SHARED
  src/listener.cpp
  )
add_demo_dependencies(topics_library)

rclcpp_components_register_node(topics_library
  PLUGIN "btob::Listener"
  EXECUTABLE listener)

install(TARGETS
  topics_library
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()

  find_package(ament_cmake_pytest REQUIRED)
  find_package(launch_testing_ament_cmake REQUIRED)
  find_package(rmw_implementation_cmake REQUIRED)
  # Add each test case.  Multi-executable tests can be specified in
  # semicolon-separated strings, like  exe1;exe2.
  set(tutorial_tests
    list_parameters_async
    list_parameters
    parameter_events_async
    parameter_events
    set_and_get_parameters_async
    set_and_get_parameters
    "talker:listener")
  set(service_tutorial_tests
    "add_two_ints_server:add_two_ints_client"
    "add_two_ints_server:add_two_ints_client_async"
  )


endif()

# Install launch files.
install(DIRECTORY
  DESTINATION share/${PROJECT_NAME}/
)

ament_package()