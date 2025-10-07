# 🏎️ F1TENTH Autonomous Racing Project

Welcome to **Big Fish Co.**'s F1Tenth project repository.
This repo contains our work on building, configuring, and experimenting with a **1/10th scale autonomous race car**. This platform is designed for learning and researching **robotics, computer vision, and autonomous systems**

--- 

## 🏁 What is F1Tenth?
F1Tenth, or RoboRacer, is an international, semi-annual autonomous racing competition where teams design and build 1/1th scale, self-driving vehicles that race each other in real-time. The cars are equipped with sensors, embedded computers, and software stacks, such as **ROS 2**, to explore algorithms for:
- Perception (LiDAR, camera-based)
- Localization & Mapping (SLAM)
- Planning & Control (Racing algorithm strategies)
- Systems Integration (ROS 2, embedded systems, real-time control)

More information about the initiative can be found at [f1tenth.org](https://f1tenth.org)

--- 

## 📁 Repository Structure

```
f1tenth/
└── documentation/
    ├── car-specs.md
    ├── . . .
    ├── launch-f1tenth-gym/
    │   ├── launch-f1tenth-gym.md
    │   ├── launch-f1tenth-gym.sh
    │   └── test-launch.sh
    ├── . . .
    └── view-imu-data.md
```

> Currently, this repository focuses on **documentation and setup guides** to help our team get the base platform standardized and running smoothly.

---

## 👨‍🏫 Mentors

This project is supported by mentors with experience in robotics, embedded systems, and autonomous vehicle development:

- [Bryan Donyanavard](https://cs.sdsu.edu/people/bryan-donyanavard/) - \[CS496 Class Instructor\]
- [Hyunjong Choi](https://cs.sdsu.edu/people/hyunjong-choi/) - \[CS496 Project Mentor\]

| Name | Role | Focus Area |
|------|------|-------------|
| \[Justin Pelak] | Team Lead | Controls / Path Planning  |
| \[Jia Gapuz] | Scribe | SLAM / LiDAR Processing / SCRUM Lead |
| \[Cameron Lee] | Developer | Controls / Systems Integration |
| \[Robert Fuller] | Developer | Gazebo / Simulation Developer |
| \[Bryle Ong] | Developer | ROS 2 / Simulation Developer | 

--- 

## 🎯 Project Goals

Our current goals include:
- Integrating LiDAR and camera sensors with onboard computation 
- Developing a baseline **autonomous driving stack** (mapping - planning - control)
- Participating in an **F1Tenth race event**

Future direction may include reinforcement learning approaches and real world deployment 

--- 

## 🛠️ Tech Stack

- **Operating System:** Ubuntu 22.04 LTS 
- **Middleware:** ROS 2 Humble Hawksbill 
- **Langauges:** C++, Python 
- **Hardware:** F1Tenth car platform (specifications can be found in `documentation/car-specs.md`)

