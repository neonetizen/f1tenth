#!/bin/bash
echo "=== Checking TF frames ==="
ros2 run tf2_tools view_frames
echo "TF tree saved as frames.pdf — open it to verify map→odom→base_link links."
