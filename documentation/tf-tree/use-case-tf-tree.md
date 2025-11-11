# Use Case: TF2 Tree Verification in Full-Stack Simulation

Primary Actor: Developer
Goal: To confirm that all coordinate frames in the simulator are correctly connected and synchronized through ```tf2```.

---

## Preconditions:
- Gazebo simulator, RViz, and Cartographer are running. 
- All nodes use /clock (use_sim_time:=true).
- The robot's URDF (description file) are properly loaded.

## Main Flow:

1. Developer launches the simulator and Cartographer nodes.
2. TF broadcasters (Gazebo, Cartographer, robot_state_publisher) begin publishing transforms.
3. Developer runs ```ros2 run tf2_tools view_frames``` or enables TF display in RViz.
4. The system visualizes the transform tree: ```map->odom->base_link->sensors```.
5. Developer verifies no missing links or multiple parents exist in the TF tree.

---

## Postconditions:
- A complete, time-synchronized TF2 tree exists connecting all frames.
- ```map->odom->base_link->sensor``` transforms are continuously published and visible in RViz.
- Localization, planning, and control modules operate with consistent spatial references.
