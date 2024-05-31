








docker run  -it -v "/home/mzins/Data/Calibration_AAOS:/data"  kalibr

source devel/setup.bash



RES=2K
MODE=stereo




/catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/H2332001/SD/still/. --output-bag H2332001_SD.bag

rosrun kalibr kalibr_calibrate_cameras \
	--target /data/april_6x6.yaml \
 	--models pinhole-equi pinhole-equi \
 	--topics /cam0/image_raw /cam1/image_raw \
 	--bag H2332001_SD.bag \
 	--bag-freq 1.0


cp H2332001_SD-camchain.yaml /data/H2332001/H2332001_SD_stereo-camchain.yaml
cp H2332001_SD-report-cam.yaml /data/H2332001/H2332001_SD_stereo-report-cam.yaml
cp H2332001_SD-results-cam.yaml /data/H2332001/H2332001_SD_stereo-results-cam.yaml





# source devel/setup.bash

# /catkin_ws/build/kalibr/atomic_configure/kalibr_bagcreater --folder /data/H2332001/2K/still/. --output-bag H2332001_2K.bag

# rosrun kalibr kalibr_calibrate_cameras \
# 	--target /data/april_6x6.yaml \
#  	--models pinhole-equi pinhole-equi \
#  	--topics /cam0/image_raw /cam1/image_raw \
#  	--bag H2332001_2K.bag \
#  	--bag-freq 1.0


# cp H2332001_2K* /data/H2332001-2