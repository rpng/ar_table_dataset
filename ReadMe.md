
# Indoor AR Table Visual-Inertial Datasets


![](d455_drivers/img/merged_overview.jpg)


In this dataset we collected a series small-scale indoor table AR visual-inertial datasets ranging from 1-2 minutes in length.
A [Intel RealSense Depth Camera D455](https://www.intelrealsense.com/depth-camera-d455/) is equipped with groundtruth Optitrack markers and provides color monocular image at 30Hz and a 400Hz IMU inertial feed from its Bosch BMI055 IMU.
Additionally, the depth projected into the color image is also recorded (untested).
Groundtruth for the IMU of each platform is found through the [vicon2gt](https://github.com/rpng/vicon2gt) utility package developed by our group.


## Quick View

```
/d455/color/image_raw                    : sensor_msgs/Image (rgb image 30hz)
/d455/imu                                : sensor_msgs/Imu (imu data 400hz)
/d455/aligned_depth_to_color/image_raw   : sensor_msgs/Image (depth 30hz)
/d455/rigidbody                          : geometry_msgs/PoseStamped (optitrack)
```


## Dataset Sequences

Each dataset has the system starting and ending at around the same location and starting from stationary.
The groundtruth for trajectory evaluation can be found in the [groundtruth/](groundtruth/) folder.
We provide the original bags along with [compressed bags](http://wiki.ros.org/rosbag/Commandline#compress) for slower internets.
To uncompress the bags one can run `rosbag decompress <bag_name>` after ensuring there is enough space to create a copy of the bag.


|        | Bag Raw | Bag Compressed | Size (GB) | Length (m) | Video (x10) |
|:------:|:-------:|:-------:|:-----:|:-----:|:-----:|
| table1 | [rosbag](https://drive.google.com/file/d/1qpjOQQYB8rvozTTbGBvuWjiat9MlDaMi/view?usp=sharing) | [rosbag]() | 4.77 | 55.6 | [link](ReadMe_Videos.md#table_01) |
| table2 | [rosbag](https://drive.google.com/file/d/1RBt8xYDsegtRiY5gKVyg9WPhecVvdXqn/view?usp=sharing) | [rosbag]() | 5.54 | 43.6 | [link](ReadMe_Videos.md#table_02) |
| table3 | [rosbag](https://drive.google.com/file/d/1_uLTYC3i2b1tx85OpGlqecxXgaO7BDT_/view?usp=sharing) | [rosbag]() | 13.19 | 87.9 | [link](ReadMe_Videos.md#table_03) |
| table4 | [rosbag](https://drive.google.com/file/d/1nYno_ttjGHwCQoxgV5SisVTc19Cb5O5c/view?usp=sharing) | [rosbag]() | 11.49 | 91.4 | [link](ReadMe_Videos.md#table_04) |
| table5 | [rosbag](https://drive.google.com/file/d/1CjkGfSCD_hWAidKsJ7edhuWQg7CyGa3U/view?usp=sharing) | [rosbag]() | 11.66 | 75.5 | [link](ReadMe_Videos.md#table_05) |
| table6 | [rosbag](https://drive.google.com/file/d/1FAGk7ZjRKDTkf-lhW3sb4EPj6SsUhyeQ/view?usp=sharing) | [rosbag]() | 5.26 | 49.9 | [link](ReadMe_Videos.md#table_06) |
| table7 | [rosbag](https://drive.google.com/file/d/1yWZGo6N0qlP_fHMIsr0jayRP3tXCO54U/view?usp=sharing) | [rosbag]() | 9.02 | 63.0 | [link](ReadMe_Videos.md#table_07) |
| table8 | [rosbag](https://drive.google.com/file/d/1pIz9owK4PvIkL_1t6eTZwGMrsLNpHBwa/view?usp=sharing) | [rosbag]() | 16.01 | 125.0 | [link](ReadMe_Videos.md#table_08) |



## Calibration Sequences

A single dataset was used for both static and dynamic calibration of the sensors using [Kalibr](https://github.com/ethz-asl/kalibr) with the [april_6x6_80x80cm.yaml](https://drive.google.com/file/d/1MAU71K1xNAG8Kq-2Gl_f4rus2LYQ9z3r/view?usp=sharing) calibration board.
Additionally, a 20 hour static IMU dataset was recorded to recover the IMU intrinsic noise properties (random walk and biases).
The parameters were found using the [allan_variance_ros](https://github.com/ori-drs/allan_variance_ros) toolbox.
Result files can be found in the [calibration/](calibration/) folder.

|         | ROS Bag | Results |
|:-------:|:-------:|:-------:|
| color1 | [download](https://drive.google.com/file/d/1YR_7qZfSidkCXLZZjPTRSeD1KnCG-mKD/view?usp=sharing) | [imu-camchain](calibration/kalibr_color_0_imu/) |
| color2 | [download](https://drive.google.com/file/d/1DeeObZC4Y7IAGS6fMFoEiGriLVn5IME3/view?usp=sharing) | [imu-camchain](calibration/kalibr_color_1_imu/) |
| static  | [download](https://drive.google.com/file/d/15sQDbNIn7GCK6641gomuzFsAX3B0UpYu/view?usp=sharing) | [plots](calibration/imu/) |




## Credit / Licensing


This dataset was collected by the [Robot Perception and Navigation Group (RPNG)](https://sites.udel.edu/robot/) at the
University of Delaware. If you have any issues with the data please open an issue on our github page with relevant
implementation details and references. For researchers that have leveraged or compared to this work, add a footnote to this repository, or use the following citation:

```txt
@misc{GITHUB_ARTABLE,
	title        = {Small-scale indoor table {AR} visual-inertial datasets with {6DoF} groundtruth},
	author       = {Patrick Geneva and Chuchu Chen and Yuxiang Peng and Woosik Lee and Chinmay Burgul and Guoquan Huang},
	year         = 2022,
	journal      = {GitHub repository},
	publisher    = {GitHub},
	howpublished = {\url{https://github.com/rpng/ar_table_dataset}},
}
```

