#!/usr/bin/env bash

source /home/rpng/workspace/catkin_ws_ov/devel/setup.bash


DATASET="/media/patrick/RPNG_DATA_6/rpng_plane"
BASEDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"



bagnames=(
    "table_01"
    "table_02"
    "table_03"
    "table_04"
    "table_05"
    "table_06"
    "table_07"
    "table_08"
)


rm -rf "$BASEDIR/groundtruth/"
rm -rf "$BASEDIR/groundtruth_info/"
mkdir -p "$BASEDIR/groundtruth/"
mkdir -p "$BASEDIR/groundtruth_info/"


# Loop through all datasets
for i in "${!bagnames[@]}"; do

roslaunch "$BASEDIR/vicon2gt.launch" \
    path_bag:="$DATASET/${bagnames[i]}.bag" \
    stats_path_states:="$BASEDIR/groundtruth/${bagnames[i]}.csv" \
    stats_path_info:="$BASEDIR/groundtruth_info/${bagnames[i]}.txt" \
    topic_imu:="/d455/imu" \
    topic_vicon:="/d455/rigidbody"

done


# convert to the right format
rosrun ov_eval format_converter "$BASEDIR/groundtruth/" &> /dev/null




