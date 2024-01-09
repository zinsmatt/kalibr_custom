
docker run -it -v "/home/mzins/dev/slam_viewer/build/recording:/data" -v "/home/mzins/dev/slam_viewer:/calib"  kalibr

source devel/setup.bash


kalibr_bagcreater --folder /data/. --output-bag xvisio_checkerboard.bag
/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag xvisio_checkerboard.bag






rosrun kalibr kalibr_calibrate_cameras \
 	--target /calib/checkerboard.yaml \
 	--models pinhole-equi pinhole-equi \
 	--topics /cam0/image_raw /cam1/image_raw \
 	--bag xvisio_checkerboard.bag \
 	--bag-freq 10.0






cp xvisio_checkerboard-camchain.yaml /calib/calib/
cp xvisio_checkerboard-results-cam.txt /calib/calib/
cp xvisio_checkerboard-report-cam.pdf /calib/calib/


rosrun kalibr kalibr_calibrate_imu_camera \
	--target /data/checkerboard.yaml \
	--imu /data/imu.yaml \
	--imu-models calibrated \
	--cam /data/xvisio_checkerboard-camchain.yaml \
 	--bag xvisio_checkerboard.bag \
 	--timeoffset-padding 0.1



docker run -it -v "/home/mzins/Data/MI9T_calibration:/data" -v "/home/mzins/Data/MI9T_calibration:/calib"  kalibr
/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater  --folder /data/. --output-bag mi9t_mono_checkerboard.bag


rosrun kalibr kalibr_calibrate_cameras \
 	--target /calib/checkerboard.yaml \
 	--models pinhole-radtan  \
 	--topics /cam0/image_raw \
 	--bag mi9t_mono_checkerboard.bag \
 	--bag-freq 10.0











docker run -it -v "/home/mzins/Data/H2320001_calibration/SD/still:/data" -v "/home/mzins/Data/H2320001_calibration/SD:/calib"  kalibr

source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag H2320001_apriltag.bag

rosrun kalibr kalibr_calibrate_cameras \
 	--target /calib/april_6x6.yaml \
 	--models pinhole-equi pinhole-equi \
 	--topics /cam0/image_raw /cam1/image_raw \
 	--bag H2320001_apriltag.bag \
 	--bag-freq 10.0

cp H2320001_apriltag* /calib




docker run -it -v "/home/mzins/Data/H2320002_calibration/SD/still:/data" -v "/home/mzins/Data/H2320002_calibration/SD:/calib"  kalibr

source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag H2320002_apriltag.bag

rosrun kalibr kalibr_calibrate_cameras \
 	--target /calib/april_6x6.yaml \
 	--models pinhole-equi pinhole-equi \
 	--topics /cam0/image_raw /cam1/image_raw \
 	--bag H2320002_apriltag.bag \
 	--bag-freq 10.0










docker run -it -v "/home/mzins/Data/H2320007_calibration/SD/still:/data" -v "/home/mzins/Data/H2320007_calibration/SD:/calib"  kalibr

source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag H2320007_apriltag.bag

rosrun kalibr kalibr_calibrate_cameras \
 	--target /calib/april_6x6.yaml \
 	--models pinhole-equi pinhole-equi \
 	--topics /cam0/image_raw /cam1/image_raw \
 	--bag H2320007_apriltag.bag \
 	--bag-freq 10.0

