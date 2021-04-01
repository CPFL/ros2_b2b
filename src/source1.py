import subprocess
import time
import signal
import re
import os

cmake_prefix_path = os.environ['CMAKE_PREFIX_PATH']
ld_library_path = os.environ['LD_LIBRARY_PATH']
ament_prefix_path = os.environ['AMENT_PREFIX_PATH']

try:
  #  input('twist_filterノードを起動し、Enterを押してください。')

    subprocess.run(['colcon', 'build'], cwd="btob", stdin=subprocess.DEVNULL)

    env_file = open('env', 'w')
    dump_env = subprocess.run(['python3', 'btob/install/_local_setup_util_sh.py', 'sh', 'bash'], stdout=env_file)
    env_file.close()

    env_file = open('env', 'r')
    env_list = env_file.readlines()
    paths = []
    for data in env_list:
        paths.append(re.sub('\$[A-Z_]*PATH', '', data.lstrip("export ").replace('"', '').strip()))
    env_file.close()

    ros2_node = subprocess.Popen(['ros2', 'run', 'pure_pursuit_nodes', 'pure_pursuit_node_exe', '--ros-args', '--remap', '__ns:=/control', '--remap', '__node:=pure_pursuit_controller', '--params-file', '/home/saitama1/adehome/AutowareAuto/install/test_trajectory_following/share/test_trajectory_following/param/pure_pursuit_controller.param.yaml', '--remap', 'current_pose:=/vehicle/vehicle_kinematic_state', '--remap', 'trajectory:=/planning/trajectory', '--remap', 'ctrl_cmd:=/vehicle/vehicle_command', '--remap', 'ctrl_diag:=/control/control_diagnostic'], stdin=subprocess.DEVNULL)

#pure_pursuitの出力ここから
    time.sleep(1)

    arg_cmake = ''
    arg_ld = ''
    arg_ament = ''
    for data in paths:
        if 'CMAKE_PREFIX_PATH' in data:
            arg_cmake = data + cmake_prefix_path
        elif 'LD_LIBRARY_PATH' in data:
            arg_ld = data + ld_library_path
        elif 'AMENT_PREFIX_PATH' in data:
            arg_ament = data + ament_prefix_path
        else:
            print("ERROE\n")
            print(data)

    
    vehicle_vehicle_command_file = open('result/vehicle_vehicle_command', 'w')
    
    control_control_diagnostic_file = open('result/control_control_diagnostic', 'w')
    

    dump_vehicle_vehicle_command = subprocess.Popen(['env', arg_cmake, arg_ld, arg_ament, 'ros2', 'run', 'btob_node', 'listener'], stdout=vehicle_vehicle_command_file)

#pure_pursuitの出力ここまで

    time.sleep(3)   #ndt_mapを取り逃していたのでファイルに書き込む準備とbag再生の間をあける

#pure_pursuitの入力ここから
    rosbag_play = subprocess.Popen(['ros2', 'bag', 'play', 'rosbag2_pure_pursuit_topics'], stdin=subprocess.DEVNULL)
#pure_pursuitの入力ここまで

    rosbag_play.wait()

except KeyboardInterrupt:
    rosbag_play.send_signal(signal.SIGINT)
    rosbag_play.wait()

finally:
    time.sleep(1)
    subprocess.Popen(['killall', '-2', 'pure_pursuit_node_exe'], stdin=subprocess.DEVNULL)    #killallの対象とするプロセス名はros2 pkg executableで確認できる
    subprocess.Popen(['killall', '-2', 'listener'], stdin=subprocess.DEVNULL)
    print('完了')

#pure_pursuit
#

#dump_vehicle_vehicle_command.send_signal(signal.SIGINT)
#dump_vehicle_vehicle_command.wait()
#vehicle_vehicle_command_file.close()
#

#dump_control_control_diagnostic.send_signal(signal.SIGINT)
#dump_control_control_diagnostic.wait()
#control_control_diagnostic_file.close()
#
#pure_pursuit

dump_vehicle_vehicle_command.send_signal(signal.SIGINT)
dump_vehicle_vehicle_command.wait()
vehicle_vehicle_command_file.close()












