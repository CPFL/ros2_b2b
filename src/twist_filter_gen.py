import subprocess
import sys
# import pyautogui as pgui
import time
import os
# import shutil
from distutils.dir_util import copy_tree
import sqlite3

# def interrupt():
#   time.sleep(3)
#   pgui.hotkey('ctrlleft','c')

def show_record():
    #SQL命令文（Fruitテーブル内のレコードを全て取得）
    sql = "SELECT * FROM topics"

    #カーソルを取得して命令を実行
    c = db.cursor()
    c.execute(sql)

    #レコードの表示
    for row in c:
        print(row)

    # sql = "SELECT * FROM messages"                topicのバイナリデータが表示されるからコメント
    # c = db.cursor()
    # c.execute(sql)
    # for row in c:
    #     print(row)

if len(sys.argv) < 2:
        print('ERROR: 引数にAutowareのPathを指定してください')
        exit()
source_bag = sys.argv[1] #テストしたいAutowareのPathを取得

# subprocess.run(('rosbag', 'filter', source_bag, 'twist_filter_topics.bag', 'topic == \'/config/twist_filter\' or topic == \'/twist_raw\' or topic == \'/twist_cmd\''))

# subprocess.run(('rosbag', 'filter', 'all_topics_01.bag', 'twist_filter_topics.bag', 'topic == \'/config/twist_filter\' or topic == \'/twist_raw\' or topic == \'/twist_cmd\''))

# subprocess.run(('rosbag', 'filter', 'all_topics_01.bag', 'pure_pursuit_topics.bag', 'topic == \'/current_velocity\' or topic == \'/config/waypoint_follower\' or topic == \'/current_pose\' or topic == \'/final_waypoints\' or topic == \'/next_target_mark\' or topic == \'/ctrl_cmd\' or topic == \'/twist_raw\' or topic == \'/trajectory_circle_mark\''))

# subprocess.run(('ros2', 'bag', 'filter', source_bag, 'ndt_matching_topics.bag', 'topic == \'/config/ndt\' or topic == \'/gnss_pose\' or topic == \'/points_map\' or topic == \'/initialpose\' or topic == \'/filtered_points\''))
# subprocess.Popen(('ros2', 'bag', 'record', '-o', 'ndt_matching_topics.bag', '-a'))
# ros2bag_recoad = subprocess.Popen(('ros2', 'bag', 'record', '-a'))

# record & play でトピックを抽出したbagファイル作成する
# ros2bag_recoad = subprocess.Popen(('ros2', 'bag', 'record', '-o', 'ndt_matching_topics.bag', '/lidar_front/points_filtered_downsampled', '/localization/ndt_map'))
# time.sleep(7)
# subprocess.run(('ros2', 'bag', 'play', source_bag))
# time.sleep(3)
# subprocess.run(('kill', '-s', '2', str(ros2bag_recoad.pid)))
# print('完了')

# ros2bag_recoad.wait()
# sys.exit()

# bagファイルをDBで編集して必要なトピックのみのbagファイルに編集

# bagファイルをコピーしてトピック抽出作業を行うbagファイルを作成

copy_tree(source_bag, "./rosbag2_pure_pursuit_topics")          #pure_pursuit
#copy_tree(source_bag, "./rosbag2_ndt_matching_topics")          #ndt_matching
# copy_tree(source_bag, "./rosbag2_euclidean")

# まずtkウィンドウで受け取ったbagファイルのフォルダ内の.bd3拡張子がついているファイルを検索
for file in os.listdir("rosbag2_pure_pursuit_topics"):          #pure_pursuit
#for file in os.listdir("rosbag2_ndt_matching_topics"):          #ndt_matching
# for file in os.listdir("rosbag2_euclidean"):
    base, ext = os.path.splitext(file)
    if ext == '.db3':
        db3_name = file
        print(db3_name)

db = sqlite3.connect("./rosbag2_pure_pursuit_topics/" + db3_name, isolation_level=None)         #pure_pursuit
#db = sqlite3.connect("./rosbag2_ndt_matching_topics/" + db3_name, isolation_level=None)         #ndt_matching
# db = sqlite3.connect("./rosbag2_euclidean/" + db3_name, isolation_level=None)


#sql = "DELETE FROM topics WHERE (name != '/localization/ndt_map') AND (name != '/lidar_front/points_filtered_downsampled') AND (name != '/localization/viz_ndt_map')"
sql = "DELETE FROM topics WHERE ((name = '/vehicle/vehicle_command') OR (name = '/control/control_diagnostic'))"        #pure_pursuit
#sql = "DELETE FROM topics WHERE (name = '/localization/ndt_pose')"         #ndt_matching
#sql = "DELETE FROM topics WHERE (name = '/lidar_bounding_boxes')"
db.execute(sql)
sql = "DELETE FROM messages WHERE topic_id NOT IN  (SELECT id FROM topics)"
db.execute(sql)
show_record()
db.close()

print('完了')





# publish: [/predict_pose, /ndt_pose, /localizer_pose,
#     /estimate_twist, /estimated_vel_mps, /estimated_vel_kmph, /estimated_vel, /time_ndt_matching,
#     /ndt_stat, /ndt_reliability]
#   subscribe: [/config/ndt, /gnss_pose, /points_map, /initialpose, /filtered_points]