Prerequisites:

Cloned and can run the simulator [sim_gazebo_ros2](https://github.com/rtecf1tenth/sim_gazebo_ros2/tree/racing-stack) that implements the map server, AMCL, GBLP, and the Controller.

Main Goal: Replace AMCL with Cartographer

1. Install Cartographer with the command 

```jsx
sudo apt install ros-humble-cartographer ros-humble-cartographer-ros
```

1. Minimal example can be found in this article: https://github.com/cartographer-project/cartographer_ros/blob/master/cartographer_ros/configuration_files/pr2.lua
2. Create a launch file in ```<your workspace>/install/src/sim_gazebo_ros2/launch``` 

Minimal example can be found here

```jsx
cartographer.launch.py file here
```

1. Edit the .rviz file and include the following lines to include Cartographer topics

```jsx
rviz config code for Cartographer info here
```

1. Launch Gazebo simulator as usual.
2. Run the following command to run the Cartographer node:

```jsx
ros2 launch rtec_vehicle_sim cartographer_localization.launch.py pbstream:=/abs/path/to/track.pbstream
```

1. Launch the Stanley Controller to watch the car create a map of the racetrack