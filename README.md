# ros2b2b

## Overview

The proposed framework stores and compares the output results of modules that are working accurately and previously ported modules with the same functionality. Experimental results show that the user can determine whether self-driving software using ROS 2 could be successfully ported to embedded platforms.
  

## Requirements

'''Autoware.Auto 0.1.0'''

ROS 2 Foxy

Ubuntu 20.04 LTS

## Steps

※Requires a bagfile that contains the input topics of the nodes to be evaluated in advance.<br>
※The config.yaml file should contain information about the nodes to be evaluated.

1.First, run python3 rosbag_test_generator.py on hardware A.<br>
2.Enter the path to the bagfile (relative to rosbag_test_generator.py) in the ROSBAG input field, and click the "Generate bagfile" button.<br>
3.Set the tolerance (tolerance is a relative error).<br>
4.Select a node to evaluate (in this case, we are using the pure_pursuit node for evaluation).<br>
5.Click the "Genarate source1.py" button.<br>
6.Click on the "Run of source1.py" button, and you will see the output results in the result folder.<br>
7.Perform steps 1~6 again on hardware B and store the output result in the result folder of hardware A.<br>
8.Click on the "Run of diff.py" button to output the results of hardware A and hardware B to the graph.<br>
* Sample.
<img src="https://github.com/CPFL/ros2b2b/blob/main/src/result/diff_pure_vehicle_vehicle_command_front_wheel_angle_rad_page-0001.jpg" alt="figure" title="figure">
9.From the output graphs, users can evaluate the porting of self-driving software.<br>

