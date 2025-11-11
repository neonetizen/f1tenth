#!/bin/bash
# checking for cartographer localization in gazebo simulation

echo "=== Checking active nodes ==="
ros2 node list | grep cartographer

echo "=== Checking topic activity ==="
ros2 topic info /scan -v
ros2 topic info /map -v
ros2 topic info /odom -v

echo "=== Test complete ==="
