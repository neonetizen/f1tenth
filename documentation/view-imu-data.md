## The IMU data is provided by the RealSense D435i
Documentation for sensor SDK and calibration tools [here](https://docs.ros.org/en/iron/p/librealsense2/user_docs/d435i.html)
## Instructions
1. Ensure ```realsense_camera``` ROS2 package is installed, this provides the nodes required to interface with RealSense cameras in ROS2
2. Launch the rs_launch.py file from the realsense2_camera package, and enable the acceleraometer and gyroscope streams.

```> ros2 launch realsense2_camera rs_launch.py enable_accel:=true enable_gyro:=true```

3. After launching, the RealSense node will publish IMU data on a topic, typically ```/camera/imu```
4. We can now use custom ROS2 nodes to process the data

## Verifiation
You can verify whether or not data is being received by checking the active topics.

```> ros2 topic list```

Returns a list of active topics. Here we can check to see if the topics are being updated with live data by running commands such as:

```> ros2 topic echo /camera/imu```

### If no data is returned from topics
Physical connectivity of sensor may be loose, or there may be an issue with the interpolation of the IMU data. Look into ```unite_imu_method``` parameter in order to experiment with different methods of uniting IMU data.
