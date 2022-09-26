#!/usr/bin/env bash

source /home/rpng/workspace/catkin_ws_kalibr/devel/setup.bash


DATASET="/media/rpng/RPNG_FLASH_5/calibration"
BASEDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/calibration"


export KALIBR_MANUAL_FOCAL_LENGTH_INIT=true


datasets=(
	"d455_calib_02"
	"d455_calib_03"
)

# scale-misalignment, calibrated


for d in "${!datasets[@]}"; do
bagname="${datasets[d]}"
rm -rf "$BASEDIR/kalibr_color_${d}_imu/"
mkdir -p "$BASEDIR/kalibr_color_${d}_imu/"
rosrun kalibr kalibr_calibrate_imu_camera \
 	--imu-models "calibrated" \
 	--reprojection-sigma 1.0 \
 	--target $BASEDIR/april_6x6_80x80cm.yaml \
 	--imu "$BASEDIR/imu.yaml" \
 	--cams "$BASEDIR/kalibr_color_${d}/$bagname-camchain.yaml" \
 	--bag "$DATASET/$bagname.bag" \
	--dont-show-report \
	# --bag-freq 10.0 \
	# --show-extraction
	# --bag-from-to 15 18 \
	# --verbose
mv "$DATASET/$bagname-camchain-imucam.yaml" "$BASEDIR/kalibr_color_${d}_imu/"
mv "$DATASET/$bagname-imu.yaml" "$BASEDIR/kalibr_color_${d}_imu/"
mv "$DATASET/$bagname-report-imucam.pdf" "$BASEDIR/kalibr_color_${d}_imu/"
mv "$DATASET/$bagname-results-imucam.txt" "$BASEDIR/kalibr_color_${d}_imu/"
done


