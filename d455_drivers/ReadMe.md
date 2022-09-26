
# Overview


The host laptop used the official realsense drivers for all recording.
See the launch files included how we launched the driver.



## Realsense Drivers

Install drivers for our D455 [realsense](https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md) camera.
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 
F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver 
hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
sudo apt install ros-melodic-realsense2-camera
sudo apt-get install librealsense2-udev-rules
sudo apt-get install librealsense2-utils
```



## Optitrack Driver


- URL: https://github.com/mit-acl/optitrack
- Commit: `05e7b1b4fc93e501eccfc7100b44602e03cd76ce`


