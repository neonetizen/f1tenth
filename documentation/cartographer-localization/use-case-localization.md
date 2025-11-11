# Use Case: Cartographer Localization in Full-Stack Simulation

Primary Actor: Developer / Autonomous Vehicle Stack  
Goal: To localize the simulated racecar within the global ```map``` frame using LIDAR and odometry data, replacing AMCL and map_server.

---

## Preconditions:
- Cartographer node is correctly configured and launched.
- Gazebo simulator and RViz are running. 
- All nodes use /clock (use_sim_time:=true).
- The TF tree includes valid ```odom->base_link``` and sensor (```base_link->laser``) transforms.

## Main Flow:

1. Developer launches the simulator (```racetrack.launch.py```)
2. Gazebo begins publishing ```/scan, /odom, and /tf.```
3. Developer launches Cartographer (```cartographer.launch.py```)
4. Cartographer subscribes to ```/scan, /odom, and /tf.```
5. Cartographer initializes SLAM and starts producing: 
	- A continuous ```map->odom``` transform.
	- ```/map``` and submap data from occupancy_grid_node for visualization.
6. Rviz subscribes to ```/map``` and TF, displaying the racecar pose aligned with the map.
7. The planner and controller consume /odom and /map data for navigation.

---

## Postconditions:
- The racecar maintains an accurate, continuous pose in the ```map``` frame.
- The map->odom->base_link chain remains valid throughout simulation.
- Planning and control modules receive consistent localization data.
