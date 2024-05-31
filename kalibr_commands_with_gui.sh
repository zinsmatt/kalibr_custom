



## run docker with gui
docker run -it --rm --privileged --net=host --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all --env=DISPLAY --env=QT_X11_NO_MITSHM=1 \
 -v /tmp/.X11-unix:/tmp/.X11-unix --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0  -v /home/mzins/Data/Calibration_AAOS:/data  kalibr

docker run  -it -v "/home/mzins/Data/Calibration_AAOS:/data"  kalibr


source devel/setup.bash
/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/H2332001/SD/still/. --output-bag H2332001_SD.bag

rosrun kalibr kalibr_calibrate_cameras \
    --show-extraction \
	--target /data/april_6x6.yaml \
 	--models pinhole-equi pinhole-equi \
 	--topics /cam0/image_raw /cam1/image_raw \
 	--bag H2332001_SD.bag \
 	--bag-freq 0.1




