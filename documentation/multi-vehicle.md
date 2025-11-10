# Multi-Vehicle Simulator
The multi-vehicle simulator provides a **complete racing software stack** with Gazebo integration for our F1Tenth autonomous racing.

It supports **ROS 2**-based control and perception pipelines.

## Realsense D435i Camera Support
First, unlike the other simulators, we will want to switch to using the **D435i** camera (the actual camera used on our hardware stack).
1. Clone the Realsense driver repository inside the ROS 2 workspace:

```bash
cd ~/ros2_ws/src
git clone https://github.com/IntelRealSense/realsense-ros.git
```
2. Build the workspace:

```bash
cd ~/ros2_ws
colcon build --symlink-install
```
3. Source the workspace:

```bash
source install/setup.bash
```
## Multi-Vehicle Simulation
Each vehicle runs in an isolated **ROS 2 namespace** for isolated control, topics, and visualization.
### Launching Multiple Vehicles
To start, we can launch with two vehicles (default/standard configuration):

```bash
source /usr/share/gazebo-11/setup.bash
ros2 launch rtec_vehicle_sim racetrack.multi_spawn.launch.py
```
### Vehicle Configuration
Vehicle details (namespace, color, spawn position, etc.) can be customized by editing:

```bash
config/multi_vehicle.yaml
```
#### Example Parameters:
```yaml
vehicles:
  - namespace: vehicle1
    color: red
    spawn_position: [0.0, 0.0, 0.1]
  - namespace: vehicle2
    color: blue
    spawn_position: [2.0, 1.0, 0.1]
```
### Controlling Individual Vehicles:
#### Keyboard Control
Use provided teleoperation scripts:
```bash
# Terminal 1 - Control vehicle 1
./scripts/teleop_vehicle1.sh
```
```bash
# Terminal 2 - Control vehicle 2
./scripts/teleop_vehicle2.sh
```
#### Command-Line Control
```bash
# Move vehicle 1 forward
ros2 topic pub /vehicle1/cmd_vel geometry_msgs/msg/Twist \
    "{linear: {x: 2.0}, angular: {z:0.0}}"
```
```bash
# Turn vehicle 2
ros2 topic pub /vehicle2/cmd_vel geometry_msgs/msg/Twist \
    "{linear: {x: 1.5}, angular: {z: 0.5}}"
```
## Topic Structure
Each vehicle publishes its own sensor and control data under its namespace
| Topic | Description |
| ----- | ----------- |
| <namespace>/cmd_vel | Command velocity |
| <namespace>/odom | Odometry |
| <namespace>/scan | LIDAR scan |
| <namespace>/camera/color/image_raw | RGB camera feed |
| <namespace>/camera/depth/image_raw | Depth image |
| <namespace>/camera/depth/color/points | Point cloud |
### View Active Topics
```bash
ros2 topic list | grep <namespace>
```

## Visualization
### Example Outputs
- Multi-vehicle simulation in Gazebo
- Individual namespaces for each vehicle
- Isolated topics for vehicle data

