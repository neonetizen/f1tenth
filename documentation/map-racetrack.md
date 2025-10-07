## Instructions

1. Ensure all necessary ROS2 mapping packages are installed.
    
    For this section, we will use the `slam_toolbox` package.
    
    ```bash
    sudo apt install ros-<distro>-slam-toolbox
    ```
    
    Replace `<distro>` with your ROS2 version (in this case we will be using ROS2 humble).
    
2. Launch the mapping node while driving the vehicle around the track.
    
    This will start the SLAM node and record LiDAR data to build the map.
    
    ```bash
    ros2 launch slam_toolbox online_async_launch.py use_sim_time:=false
    ```
    
    Make sure your LiDAR driver node is already running and publishing on `/scan`.
    
3. Drive the vehicle slowly around the racetrack.
    
    Move in a complete loop so the SLAM algorithm can close the loop and align features accurately.
    
4. Save the generated map once the track is fully mapped.
    
    ```bash
    ros2 service call /slam_toolbox/save_map slam_toolbox/srv/SaveMap "{name: 'racetrack_map'}"
    ```
    
    This will create a `racetrack_map.yaml` and `racetrack_map.pgm` file in the current working directory.
    

## Verification

You can verify that the map data is being published correctly by checking the active topics:

```bash
ros2 topic list
```

Look for the topic:

```
/map
```

### If No Map Is Being Generated

- Check if LiDAR data is being published:
    
    ```bash
    ros2 topic echo /scan
    ```
    
    If no data appears, ensure your LiDAR is properly connected and powered.
    
- Confirm `slam_toolbox` is subscribed to the correct topic (`/scan`).
- Verify the robot is publishing transforms (`/tf` and `/odom`).
- If the map drifts or deforms, adjust SLAM parameters (e.g. scan matching thresholds or loop closure settings).