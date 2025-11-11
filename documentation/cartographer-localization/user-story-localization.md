# Running Cartographer as Localization Algorithm for Full-Stack Simulation

---

### Description
This user story details how Cartographer provides localization within the full racing stack. Cartographer continuously estimates the vehicle's position by fusing LIDAR scan matching and odometry data to maintain a consistent map->odom->base_link transform chain. Cartographer performs real-time (localization and mapping) SLAM, meaning it builds and refines the map while localizing the vehicle against it.

### Goal
To allow the simulated racecar to maintain a stable global pose in the map frame, enabling the planner and controller to operate on a consistent coordinate system.

---

### System Context
#### Inputs:   
```/scan, /odom, /tf, /clock (Gazebo)``` 
#### Outputs:   
```/map, /tf (map->odom), /trajectory_node_list, /submap_list```  
#### Frames:   
```map->odom->base_link->laser```  

#### Launch Dependencies:
- ```rtec_vehicle_sim/racetrack.launch.py``` - starts Gazebo and RViz 
- ```rtec_vehicle_sim/cartographer.launch.py``` - runs Cartographer in localization mode 

---

### Localization Behavior
Live localization: Cartographer aligns each new LIDAR scan with its submaps (provided by the occupancy grid node) and fuses odometry to estimate the robot's 2D pose. This produces a continuous correction between the odom and map frames. Submaps are generated as the car moves, meaning this is live localization within an evolving map.

Static localization: Cartographer can localize purely against the pre-built map. This requires the user to save a map using ```slam_toolbox```. 

---
