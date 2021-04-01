import sys
import os
import yaml
from jinja2 import Template, Environment, FileSystemLoader
#----------------------------------------------------------------
# Convert the value of boolean to 'true' or 'false'.
# def boolstr(value):
#     if value: return 'true'
#     return 'false'
# # Convert to 0x00 format.
# def hex(value):
#     return format(value, '#04x')
#----------------------------------------------------------------
# Generate file from Jinja2 template.
def genJ2(templateFile, configFile, genFile):
    # Load template.
    env = Environment(loader=FileSystemLoader('.', encoding='utf_8_sig'))
    # env.filters['boolstr'] = boolstr
    # env.filters['hex'] = hex
    tpl = env.get_template(templateFile)
    # Load config.
    with open(configFile, encoding='utf_8_sig') as stream:
        data = yaml.load(stream, Loader=yaml.SafeLoader)
    if len(sys.argv) < 2:
        print('ERROR: 引数にノード名を指定してください')
        exit()
    # msg_install_path = '/home/takano/adehome/AutowareAuto/install/autoware_auto_msgs'        #AutowareAutoへの相対パス。BtoBのフォルダ構成を整理したらここも直す
    msg_include = ''
    ns = data['root'][sys.argv[1]]['namespace']
    hd = ''
    for lp in range(len(ns)):
        if ns[lp].isupper():
            if lp == 0:
                hd = hd + ns[lp].lower()
            else:
                hd = hd + '_' + ns[lp].lower()
        else:
            hd = hd + ns[lp]
    hd = hd + '.hpp'
    # print(hd)
    # for dirPath, dirList, fileList in os.walk(msg_install_path):
    #     for fileName in fileList:
    #         if fileName == hd:
    #             msg_include = '../../../' + dirPath + '/' + fileName        #listener.cppからの相対パスになるよう整形
    msg_include = data['root'][sys.argv[1]]['msg'] + "/msg/" + hd #includeするときの形
    data['target_node'] = sys.argv[1] #テストしたいノード名を取得
    data['root'][sys.argv[1]]['include'] = msg_include
    #print(data) #実際に使ってるものを見れる
    # Render
    render = tpl.render(data)
    # Output
    with open(genFile, 'w', encoding='utf_8_sig') as stream:
        stream.write(render)
# ----------------------------------------------------------------
genJ2('template.j2', 'config.yaml', 'source1.py')
genJ2('template2.j2', 'config.yaml', 'btob/src/listener.cpp')
genJ2('CMakeLists_temp.j2', 'config.yaml', 'btob/CMakeLists.txt')
genJ2('package_temp.j2', 'config.yaml', 'btob/package.xml')
print('source1生成')
