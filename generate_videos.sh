#!/usr/bin/env bash

source /home/rpng/workspace/catkin_ws_ov/devel/setup.bash


DATASET="/media/patrick/RPNG_DATA_6/rpng_plane"
BASEDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

mkdir -p "$BASEDIR/videos/"


# https://github.com/mlaiacker/rosbag2video
# sudo apt install ffmpeg
# sudo apt install python3-rospkg python3-sensor-msgs python3-opencv
# only works on 20.04 it seems...


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


# Loop through all datasets
for i in "${!bagnames[@]}"; do

python3 $BASEDIR/rosbag2video.py \
    --fps 30 --rate 10 -o "$BASEDIR/videos/${bagnames[i]}.mp4" \
    -t "/d455/color/image_raw" \
    "$DATASET/${bagnames[i]}.bag" #&> /dev/null

done


