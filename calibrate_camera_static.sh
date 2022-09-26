#!/usr/bin/env bash

source /home/rpng/workspace/catkin_ws_kalibr/devel/setup.bash


DATASET="/media/rpng/RPNG_FLASH_5/calibration"
BASEDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/calibration"


export KALIBR_MANUAL_FOCAL_LENGTH_INIT=true


datasets=(
	"d455_calib_02"
	"d455_calib_03"
)


for d in "${!datasets[@]}"; do
bagname="${datasets[d]}"
rm -rf "$BASEDIR/kalibr_color_${d}/"
mkdir -p "$BASEDIR/kalibr_color_${d}/"
rosrun kalibr kalibr_calibrate_cameras \
 	--target $BASEDIR/april_6x6_80x80cm.yaml \
 	--models pinhole-radtan \
 	--topics "/d455/color/image_raw" \
 	--bag "$DATASET/$bagname.bag" \
	--dont-show-report \
	--bag-freq 10.0 \
	# --show-extraction
	# --bag-from-to 15 18 \
	# --verbose
mv "$DATASET/$bagname-camchain.yaml" "$BASEDIR/kalibr_color_${d}/"
mv "$DATASET/$bagname-report-cam.pdf" "$BASEDIR/kalibr_color_${d}/"
mv "$DATASET/$bagname-results-cam.txt" "$BASEDIR/kalibr_color_${d}/"
done



