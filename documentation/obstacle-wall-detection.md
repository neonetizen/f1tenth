# Instructions

## 1. Ensure that all necessary ROS2 packages are installed, along with a compatible sim. 

For these instructions we will use the F1TENTH simulator and RViz to see the detected obstacles. 
## 2. Launch the F1TENTH simulator

This will start the environment with LiDAR sensor data.

```bash
   ros2 launch f1tenth_gym_ros gym_bridge_launch.py
```

You can also use our F1TENTH gym install guide.

The simulator automatically detects walls and any obstacles in the environment through the LiDAR sensor.  
## 3. Visualize the Obstacle detection in RViz 

Launch RViz to see the detected obstacles from the LiDAR data.

```bash
ros2 run rviz2 rviz2
```

In RViz:

- Set **Fixed Frame** to `ego_racecar/base_link`
- Click **Add** → **By topic** → `/scan` → **LaserScan**
- The LaserScan display automatically shows all detected walls and obstacles

## 4. Drive the car to test the obstacle detection

Use the keyboard to drive towards a wall or obstacle. The Lidar will update in real time when the obstacles are within range.


# Verification

You can verify that obstacle detection is working by checking the LiDAR scan topic:

```bash
ros2 topic list
```

Look for the topic:

```bash
/scan
```

Check that the scan data is being published at the correct rate:

```bash
ros2 topic hz /scan
```

The rate should be at least 10 Hz

View the scan data to confirm obstacles are being detected:
```bash
ros2 topic echo /scan
```

The `ranges` array will show distance values to detected obstacles. Lower values indicate closer obstacles.