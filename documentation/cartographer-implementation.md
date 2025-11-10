Prerequisites:

Cloned and can run the simulator [sim_gazebo_ros2](https://github.com/rtecf1tenth/sim_gazebo_ros2/tree/racing-stack) that implements the map server, AMCL, GBLP, and the Controller.

Main Goal: Replace AMCL with Cartographer

1. Install Cartographer with the command 

```jsx
sudo apt install ros-humble-cartographer ros-humble-cartographer-ros
```

2. Minimal example can be found in this article: https://github.com/cartographer-project/cartographer_ros/blob/master/cartographer_ros/configuration_files/pr2.lua
3. Create a launch file in ```<your workspace>/install/src/sim_gazebo_ros2/launch/cartographer_localization.launch.py``` 

Minimal launch.py file:

```jsx
import os
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory

def generate_launch_description():
    pkg_share = get_package_share_directory('rtec_vehicle_sim')

    # Path to your Cartographer LUA config (you add this file under config/)
    config_dir = os.path.join(pkg_share, 'config')

    return LaunchDescription([
        # pass the pbstream on the command line
        DeclareLaunchArgument(
            'pbstream',
            default_value='/tmp/track.pbstream',
            description='Path to Cartographer .pbstream'
        ),

        Node(
            package='cartographer_ros',
            executable='cartographer_node',
            name='cartographer_node',
            output='screen',
            parameters=[{
                'use_sim_time': True,
                'load_state_filename': LaunchConfiguration('pbstream'),
                'pure_localization': True,
                'start_trajectory_with_default_topics': True
            }],
            arguments=[
                '-configuration_directory', config_dir,
                '-configuration_basename', 'cartographer_f1tenth_2d.lua'
            ],
            remappings=[
                ('scan', '/scan'),
                ('odom', '/odom'),
            ],
        ),

        # Optional: publish /map for RViz/costmaps. If you keep your map_server, you can delete this node.
        Node(
            package='cartographer_ros',
            executable='cartographer_occupancy_grid_node',
            name='occupancy_grid_node',
            output='screen',
            parameters=[{'use_sim_time': True, 'resolution': 0.05, 'publish_period_sec': 0.5}],
        ),
    ])
```

4. Edit the .rviz file and include the following lines to include Cartographer topics

```jsx
Alpha: 1
      Axes Length: 1
      Axes Radius: 0.10000000149011612
      Class: rviz_default_plugins/PoseWithCovariance
      Color: 26; 95; 180
      Covariance:
        Orientation:
          Alpha: 0.5
          Color: 255; 255; 127
          Color Style: Unique
          Frame: Local
          Offset: 1
          Scale: 1
          Value: true
        Position:
          Alpha: 0.30000001192092896
          Color: 204; 51; 204
          Scale: 1
          Value: true
        Value: true
      Enabled: true
      Head Length: 0.30000001192092896
      Head Radius: 0.10000000149011612
      Name: AMCL pose
      Shaft Length: 1
      Shaft Radius: 0.05000000074505806
      Shape: Arrow
      Topic:
        Depth: 5
        Durability Policy: Volatile
        Filter size: 10
        History Policy: Keep Last
        Reliability Policy: Reliable
        Value: /amcl_pose
```

5. Launch Gazebo simulator as usual.
6. Run the following command to run the Cartographer node:

```jsx
ros2 launch rtec_vehicle_sim cartographer_localization.launch.py pbstream:=/abs/path/to/track.pbstream
```

7. Launch the Stanley Controller to watch the car create a map of the racetrack