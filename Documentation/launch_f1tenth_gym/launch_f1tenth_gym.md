## Use Case: User runs F1TENTH Gym inside Docker and views simulator via noVNC  

### Actors: Developer, ROS2 Simulator, Docker Environment  

### Preconditions:  
- Ubuntu 22.04 with ROS 2 Humble installed  
- Docker and docker-compose installed and verified  
- The F1TENTH Gym repository is cloned at `~/f1tenth_gym_ros2_humble`

### Flow of Events:  
1. Developer executes the launch script (`launch_f1tenth_gym.sh`).
2. Docker Compose initializes required containers.
3. Simulator services start, exposing ports for noVNC (8080) and ROS2 nodes.
4. Developer connects to `http://localhost:8080/vnc.html` to access GUI.
5. Developer interacts with simulator; verifies data topics publish correctly.
6. Developer stops the simulation with `Ctrl + C`.
7. Containers shut down gracefully.

### Postconditions:  
- All containers are stopped (`docker ps` returns no active simulator containers).
- The simulator environment can be relaunched without error.
- Generated logs confirm successful run and shutdown.

### Acceptance criteria:  
- Containers launch without error messages.
- The noVNC interface loads and displayers the simulator.
- ROS2 topics publish expected data.
- Exiting the process stops all simulator containers.

### Acceptance test:  
- `./launch_f1tenth_gym.sh` runs without errors.  
- `curl -f http://localhost:8080/vnc.html` returns HTTP 200.  
- Within noVNC, the simulator window is visible and interactive.    
- After termination (`Ctrl + C`), `docker ps` shows no running containers.  

### Reference: [F1TENTH Gym ROS2 Humble Repository](https://github.com/ray-quasar/f1tenth_gym_ros2_humble?tab=readme-ov-file#without-an-nvidia-gpu)  
