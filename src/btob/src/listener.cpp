//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "rclcpp/rclcpp.hpp"
#include "rclcpp_components/register_node_macro.hpp"
#include "btob/visibility_control.h"
#include "autoware_auto_msgs/msg/vehicle_control_command.hpp"

namespace btob
{
// Create a Listener class that subclasses the generic rclcpp::Node base class.
// The main function below will instantiate the class as a ROS node.
class Listener : public rclcpp::Node
{
  using Command = autoware_auto_msgs::msg::VehicleControlCommand;
public:
  DEMO_NODES_CPP_PUBLIC
  explicit Listener(const rclcpp::NodeOptions & options)
  : Node("listener", options)
  {
    auto callback =    //pure_pursuitの受信用
      [this](const Command::SharedPtr msg) -> void
      {

        
        printf("%.16f", msg->long_accel_mps2);
        
        printf(",");
        
        
        printf("%f", msg->velocity_mps);
        
        printf(",");
        
        
        printf("%.20f", msg->front_wheel_angle_rad);
        
        printf(",");
        
        
        printf("%.10f", msg->rear_wheel_angle_rad);
        
        

        printf("\n");

      };

    sub_pure_pursuit_ = create_subscription<Command>("vehicle/vehicle_command", rclcpp::QoS{rclcpp::KeepAll()}.durability_volatile().reliable(), callback);
  }
  

private:
  rclcpp::Subscription<Command>::SharedPtr sub_pure_pursuit_;
};

}  // namespace btob

RCLCPP_COMPONENTS_REGISTER_NODE(btob::Listener)