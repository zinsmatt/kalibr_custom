

docker run -it -v "/home/mzins/Data/H2320007_imu_camera_calibration:/data" kalibr
source devel/setup.bash
/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/data/. --output-bag data_cam_imu.bag



rosrun kalibr kalibr_calibrate_imu_camera \
	--target /data/april_6x6.yaml \
	--imu /data/imu.yaml \
	--imu-models calibrated \
	--cam /data/H2320007_apriltag-camchain.yaml \
 	--bag data_cam_imu.bag \
 	--timeoffset-padding 0.1

cp data_cam_imu* /data/data










docker run -it -v "/home/mzins/Data/MI9T_imu_camera_calibration:/data" kalibr

source devel/setup.bash
/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/seq6/. --output-bag data_cam_imu.bag



rosrun kalibr kalibr_calibrate_imu_camera \
	--target /data/checkerboard_4x6.yaml \
	--imu /data/imu.yaml \
	--imu-models calibrated \
	--cam /data/mi9t_mono_checkerboard-camchain.yaml \
 	--bag data_cam_imu.bag \
 	--timeoffset-padding 0.1

cp data_cam_imu* /data