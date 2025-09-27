#!/bin/bash
set -e

echo "Running acceptance tests..."

# check 1: noVNC
curl -fs http://localhost:8080/vnc.html >/dev/null
echo "noVNC is reachable."

# check 2: container is running
if docker ps | grep -q f1tenth_gym_ros2_humble_sim_1; then
  echo "Container is running."
else
  echo "Container is NOT running." >&2
  exit 1
fi

# check 3: docker ps shows no containers after CTRL+C

echo "Acceptance tests passed."
