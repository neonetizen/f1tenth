This documentation outlines the steps to set up a silumator through Gazebo and RViz with a map server, graph-based local planning, adavptive monte carlo localization and a controller.

1. Install packages for slam_toolbox, nav2, and gazebo_ros_pkgs
2. Clone and set up the following repositories in a workspace:

https://github.com/rtecf1tenth/sim_gazebo_ros2/tree/racing-stack

https://github.com/rtecf1tenth/stanley_controller

https://github.com/rtecf1tenth/gblp

https://github.com/rtecf1tenth/ackermann_drive_to_cmd_vel

https://github.com/ANI717/aws-robomaker-racetrack-world-ros2

Instructions for building the individual repositories are included in thier respective repositories.

3. Build the workspace with the following command:

```jsx
cd ~/ros2_ws
colcon build
source install/setup.bash
```

4. To launch the simulator run the command:

```jsx
ros2 launch rtec_vehicle_sim [racetrack.launch.py](http://racetrack.launch.py/)
```

5. To run the map server run the command:

```jsx
ros2 launch rtec_vehicle_sim map_server.launch.py
```

6. To run AMCL:

```jsx
ros2 launch rtec_vehicle_sim [amcl.launch.py](http://amcl.launch.py/)
```

7. To run the controller algorithm, run the command:

```jsx
ros2 launch rtec_vehicle_sim [stanley.launch.py](http://stanley.launch.py/)
```

8. To run the graph-based local planner, run the command:

```jsx
python3 path/to/ros/src/gblp/graph_based_local_planner_ros/main_sim.py
```

In the case that Gazebo Client runs errors, run the command:

```jsx
source /usr/share/gazebo-11/setup.bash
```