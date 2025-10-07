## Using ROS2 To Interact with Gazebo
In-depth guide can be found [here](https://gazebosim.org/docs/latest/ros2_integration/)

### In summary we must:
1. Initialize a bidirectional bridge with ROS as the publisher and Gazebo as the subcscriber. (can be done manually or be scripted).
2. Use the ```Key Publisher``` Gazebo plugin in order to push key strokes to ROS.

## Testing Input
1. Start the bridge between ROS and Gazebo specifying parameters for the ```Key Publisher```.

    ```> ros2 run ros_gz_bridge parameter_bridge /keyboard/keypress@std_msgs/msg/Int32@gz.msgs.Int32```

2. In another terminal, launch a Gazebo Sim world

    ```> gz sim empty.sdf```

3. Add the ```Key Publisher``` plugin from the dropdown menu on the top right corner.
4. Start the ROS listener in another terminal

    ```> ros2 topic echo /keyboard/keypress```

5. Now the listener should get messages sent over the ```/keyboard/keypress``` topic.

## Acceptance Critera:
### Scenario 1: 
Keyboard inputs sent through ROS2 are picked up by the Gazebo listener and can be seen in the simulation, this verifies that data is successfully being communicated; thus, proving that we will be able to run our own custom scripts and algorithms.

### Scenario 2:
Keyboard inputs are not being communicated to the listener due to problems with the bridge between ROS and Gazebo.