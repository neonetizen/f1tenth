#!/bin/bash
# checking for cartographer localization in gazebo simulation

echo "=== Checking active nodes ==="
ros2 node list | grep cartographer

echo "=== Checking topic activity ==="
/bin/bash -c "ros2 topic hz /scan --window 1 --once"
/bin/bash -c "ros2 topic hz /odom --window 1 --once"
/bin/bash -c "ros2 topic hz /map --window 1 --once"

echo "=== Test complete ==="
