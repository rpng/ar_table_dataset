#!/usr/bin/env bash

source /home/patrick/workspace/catkin_ws_ov/devel/setup.bash


DATASET="/media/patrick/RPNG_FLASH_5/calibration"
BASEDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/calibration"



#rm -rf "$BASEDIR/imu/"
mkdir -p "$BASEDIR/imu/"
cd "$BASEDIR/imu/"
cp "$DATASET/d455_imu_static.bag" imu_static_tmp.bag

TEXT="imu_topic: \"/d455/imu\"
imu_rate: 400
measure_rate: 400
sequence_time: 73712"
echo "$TEXT" > allan_config.yaml

rosrun allan_variance_ros allan_variance "$BASEDIR/imu/" allan_config.yaml &> /dev/null
rosrun allan_variance_ros analysis.py --data allan_variance.csv --config allan_config.yaml

rm imu_static_tmp.bag







