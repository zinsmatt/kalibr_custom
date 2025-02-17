import glob
import os
import shutil

import cv2
import os
import numpy as np
import yaml
from yaml import load, dump
import glob
try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper


def convertToYamlOcv(in_file, out_file):
    data = yaml.load(open(in_file, 'r'), Loader=Loader)

    fs = cv2.FileStorage(out_file, cv2.FILE_STORAGE_WRITE)

    def write(fs, data):
        for key, item in data.items():
            if type(item) is dict:
                fs.startWriteStruct(key, cv2.FileNode_MAP)
                write(fs, item)
                fs.endWriteStruct()
            else:
                if type(item) is list:
                    item = np.array(item)
                fs.write(key, item)


    write(fs, data)
    fs.release()

in_file = "/home/mzins/Data/calibration_tof/Cart3D-002/cart3d_002_tof-camchain.yaml"
out_file = "/home/mzins/Data/calibration_tof/Cart3D-002/ocv/cart3d_002_tof-camchain.yaml"

convertToYamlOcv(in_file, out_file)