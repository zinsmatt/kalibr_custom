

docker run -it -v "/home/mzins/Data/H2320007_imu_camera_calibration:/data" kalibr

source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/allan_variance_data/. --output-bag data_imu.bag
rosbag info data_imu.bag

rosrun allan_variance_ros cookbag.py --input data_imu.bag --output data_imu_cooked.bag
mkdir cooked
mv data_imu_cooked.bag cooked

roscore & # to be able to see the printing
rosrun allan_variance_ros allan_variance cooked/  /data/config.yaml

rosrun allan_variance_ros analysis.py --data cooked/allan_variance.csv

