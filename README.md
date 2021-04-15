# ros2b2b

## Overview

* The proposed framework can evaluate the porting for self-driving software.<br>
* The proposed framework can perform tests with the same input data.<br>
  

## Requirements

Autoware.Auto 0.1.0

ROS 2 Foxy

Ubuntu 20.04 LTS

## Steps

※Requires a bagfile that contains the output topics of the nodes to be evaluated in advance.

1.First, run python3 rosbag_test_generator.py on hardware A.<br>
2.Enter the path to the bagfile (relative to rosbag_test_generator.py) in the ROSBAG input field, and click the "Generate bagfile" button.<br>
3.Set the tolerance (tolerance is a relative error).<br>
4.Select a node to evaluate (in this case, we are using the pure_pursuit node for evaluation).<br>
5.Click the "Genarate source1.py" button.<br>
6.Click on the "Run of source1.py" button, and you will see the output results in the result folder.<br>
7.Perform steps 1~6 again on hardware B and store the output result in the result folder of hardware A.<br>
8.Click on the "Run of diff.py" button to output the results of hardware A and hardware B to the graph.<br>
* This figure is the one we evaluated.
<img src="https://github.com/CPFL/ros2b2b/blob/main/src/result/diff_pure_vehicle_vehicle_command_front_wheel_angle_rad_page-0001.jpg" alt="エビフライトライアングル" title="サンプル">
9.From the output graphs, users can evaluate the porting of self-driving software.<br>


![秋田犬](https://github.com/CPFL/ros2b2b/blob/main/src/result/diff_pure_vehicle_vehicle_command_front_wheel_angle_rad_page-0001.jpg)
