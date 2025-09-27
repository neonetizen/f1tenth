#!/bin/bash
set -e # exit immediately if any command fails

echo "This script launches Ray-Quasar F1tenth gym"

cd ~/f1tenth_gym_ros2_humble

# start docker container
docker-compose up -d

# tell user to open the browser
echo "Open noVNC: http://localhost:8080/vnc.html" # noVNC
read -p "Press Enter once noVNC is open"

# launch the simulation inside container
docker exec f1tenth_gym_ros2_humble_sim_1 bash -c \
	"source /opt/ros/humble/setup.bash && \
	source install/local_setup.bash && \
	ros2 launch f1tenth_gym_ros gym_bridge_launch.py"

# bring down containers after CTRL+C
docker-compose down
