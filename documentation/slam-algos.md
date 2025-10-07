### ORBSLAM

- feature-based SLAM system
- detects disctintive points in frames (corners or edges)
- good for building 3d maps
- can operate using just mono/stereo camera + IMU
    - we eliminate the need to use the LiDAR camera
- computationally heavy
- might be overkill if we are only interested in 2d mapping

### Hector SLAM

- scan-matching based SLAM, uses 2d LiDAR
- utilizes a 2D occupancy grid map (quick and simple)
- map quality depends of decent laser scanner + flat driving environment
- only 2D
- no loop closure
    - drifting may accumulate and map might be inaccurate

### Cartographer

- 2D & 3D LiDAR + IMU SLAM
- widely used in F1tenth
- handles drift better than Hector SLAM
- is computationally heavier than Hector SLAM

### GMapping

- 2D LiDAR-based particle filter SLAM
- is a classic ROS package, often the default when mapping with LiDAR
- good with small to medium maps
- has loop closure
- struggles with fast vehicle motion (can’t keep up)