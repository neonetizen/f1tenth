# Use Case: 
## User runs f1tenth Gym inside Docker and views simulator via noVNC.

## Starting point:
[https://github.com/ray-quasar/f1tenth_gym_ros2_humble?tab=readme-ov-file#without-an-nvidia-gpu]  

## Preconditions:
- User is on Ubuntu 22.04 and has ROS 2 Humble  
- Docker is installed correctly (docker and docker-compose)  
- The f1tenth Gym is located at ~/f1tenth_gym_ros2_humble (hardcoded to start_ros2_gym.sh)  
 
## Acceptance criteria:
- Docker containers start successfully  
- noVNC URL is accessible from browser  
- Simulator GUI appears inside remote desktop  
- Stopping the process shuts down containers  

## Acceptance test:
- Script executes without  errors  
- 'curl -f http://localhost:8080/vnc.html' returns HTTP 200  
- Within noVNC, simulator window is visible and interactive  
- After Ctrl-C, docker ps shows no running containers  

## Postcondition:
- Simulation was accessed on browser  
