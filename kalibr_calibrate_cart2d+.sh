# visual

docker run -it  -v "/home/mzins/Data/calibration_cart2d+/H2415005/still/:/data" -v "/home/mzins/Data/calibration_cart2d+/:/calib"  kalibr


source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag H2415005.bag

rosrun kalibr kalibr_calibrate_cameras \
	--target /calib/april_6x6.yaml \
 	--models pinhole-radtan \
 	--topics /cam1/image_raw \
 	--bag H2415005.bag

cp H2415005-* /calib/








# visual-inertial
docker run -it --rm --privileged --net=host --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all --env=DISPLAY --env=QT_X11_NO_MITSHM=1 \
 -v /tmp/.X11-unix:/tmp/.X11-unix --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0  -v "/home/mzins/Data/calibration_cart2d+/H2415005/imu_6/:/data" -v "/home/mzins/Data/calibration_cart2d+/:/calib"  kalibr


# docker run -it  -v "/home/mzins/Data/calibration_cart2d+/H2415005/imu_1/:/data" -v "/home/mzins/Data/calibration_cart2d+/:/calib"  kalibr

source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag H2415005.bag

rosrun kalibr kalibr_calibrate_imu_camera \
	--target /calib/april_6x6.yaml \
    --imu /calib/imu.yaml \
	--imu-models calibrated \
	--cam /calib/H2415005-camchain.yaml \
 	--bag H2415005.bag 
	# --timeoffset-padding 0.5
    # --verbose


# --reprojection-sigma 0.3 \
# --timeoffset-padding 0.1

cp H2415005-* /calib/











# visual devkit

docker run -it  -v "/home/mzins/Data/calibration_devkit_imu/camera/:/data" -v "/home/mzins/Data/calibration_devkit_imu/:/calib"  kalibr


source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag devkit.bag

rosrun kalibr kalibr_calibrate_cameras \
	--target /calib/april_6x6.yaml \
 	--models pinhole-equi pinhole-equi \
 	--topics /cam0/image_raw /cam1/image_raw \
 	--bag devkit.bag

cp devkit-* /calib/




# visual-inertial devkit
docker run -it --rm --privileged --net=host --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all --env=DISPLAY --env=QT_X11_NO_MITSHM=1 \
 -v /tmp/.X11-unix:/tmp/.X11-unix --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0  -v "/home/mzins/Data/calibration_devkit_imu/imu_1/:/data" -v "/home/mzins/Data/calibration_devkit_imu/:/calib"  kalibr


source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag devkit.bag

rosrun kalibr kalibr_calibrate_imu_camera \
	--target /calib/april_6x6.yaml \
    --imu /calib/imu.yaml \
	--imu-models calibrated \
	--cam /calib/devkit-camchain.yaml \
 	--bag devkit.bag
	
	# --timeoffset-padding 0.2


cp devkit-* /calib/




# create bag for basalt calibration


# visual-inertial devkit
docker run -it --rm --privileged --net=host --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all --env=DISPLAY --env=QT_X11_NO_MITSHM=1 \
 -v /tmp/.X11-unix:/tmp/.X11-unix --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0  -v "/home/mzins/Data/calibration_devkit_imu/basalt_calib/imu_0/:/data" -v "/home/mzins/Data/calibration_devkit_imu/:/calib"  kalibr


source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag devkit.bag





# --------------- test mono-inertial -------------------



# visual devkit mono (left)

docker run -it  -v "/home/mzins/Data/calibration_devkit_imu/camera/:/data" -v "/home/mzins/Data/calibration_devkit_imu/:/calib"  kalibr


source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag devkit_mono_left.bag

rosrun kalibr kalibr_calibrate_cameras \
	--target /calib/april_6x6.yaml \
 	--models pinhole-equi \
 	--topics /cam0/image_raw \
 	--bag devkit_mono_left.bag

cp devkit_mono_left-* /calib/mono-inertial



# visual devkit mono-inertial (left)
docker run -it --rm --privileged --net=host --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all --env=DISPLAY --env=QT_X11_NO_MITSHM=1 \
 -v /tmp/.X11-unix:/tmp/.X11-unix --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0  -v "/home/mzins/Data/calibration_devkit_imu/imu_0/:/data" -v "/home/mzins/Data/calibration_devkit_imu/:/calib"  kalibr


source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag devkit_mono_left.bag

rosrun kalibr kalibr_calibrate_imu_camera \
	--target /calib/april_6x6.yaml \
    --imu /calib/imu.yaml \
	--imu-models calibrated \
	--cam /calib/mono-inertial/devkit_mono_left-camchain.yaml \
 	--bag devkit_mono_left.bag
	
	# --timeoffset-padding 0.2


cp devkit_mono_left-* /calib/mono-inertial


# visual devkit mono (right)

docker run -it  -v "/home/mzins/Data/calibration_devkit_imu/camera/:/data" -v "/home/mzins/Data/calibration_devkit_imu/:/calib"  kalibr


source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag devkit_mono_right.bag

rosrun kalibr kalibr_calibrate_cameras \
	--target /calib/april_6x6.yaml \
 	--models pinhole-equi \
 	--topics /cam1/image_raw \
 	--bag devkit_mono_right.bag

cp devkit_mono_right-* /calib/mono-inertial



# visual devkit mono-inertial (right)
docker run -it --rm --privileged --net=host --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all --env=DISPLAY --env=QT_X11_NO_MITSHM=1 \
 -v /tmp/.X11-unix:/tmp/.X11-unix --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0  -v "/home/mzins/Data/calibration_devkit_imu/imu_0/:/data" -v "/home/mzins/Data/calibration_devkit_imu/:/calib"  kalibr


source devel/setup.bash

/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/. --output-bag devkit_mono_right.bag

rosrun kalibr kalibr_calibrate_imu_camera \
	--target /calib/april_6x6.yaml \
    --imu /calib/imu.yaml \
	--imu-models calibrated \
	--cam /calib/mono-inertial/devkit_mono_right-camchain.yaml \
 	--bag devkit_mono_right.bag
	
	# --timeoffset-padding 0.2


cp devkit_mono_right-* /calib/mono-inertial

