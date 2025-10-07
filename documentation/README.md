# 📚 F1TENTH Documentation

This directory contains setup guides, simulation instructions, and technical notes for our **F1TENTH autonomous racing platform**.  
Use this as a reference for configuring your environment, running simulations, and understanding key system components.
Note that each guide will have a test case to verify completion.

---

## 📁 Directory Overview

```
documentation/
├── car-specs.md
├── gazebo-sim.md
├── launch-f1tenth-gym/
│ ├── launch-f1tenth-gym.md
│ ├── launch-f1tenth-gym.sh
│ └── test-launch.sh
├── map-racetrack.md
├── ros2-humble-install.md
├── run-sim-code.md
├── slam-algos.md
├── ubuntu-install.md
└── view-imu-data.md
```

---

## 🧩 File Summaries

### **ubuntu-install.md**
Step-by-step guide for installing **Ubuntu 22.04 LTS** on a VM or dedicated machine.

### **ros2-humble-install.md**
Instructions for installing and configuring **ROS 2 Humble Hawksbill**.

### **car-specs.md**
Overview of the F1TENTH hardware setup -- computing board, sensors (LiDAR, IMU, camera), motor controller, and chassis specifications.

### **map-racetrack.md**
Guide to mapping the race environment using sensor data. Explains how to record and process maps for SLAM and path planning.

### **slam-algos.md**
Comparison and notes on various **SLAM (Simultaneous Localization and Mapping)** algorithms tested with the F1TENTH platform (e.g., ORBSLAM,  Cartographer, GMApping).

### **view-imu-data.md**
Instructions for visualizing and analyzing **IMU sensor data** from the car or simulation to verify sensor calibration and orientation tracking.

### **gazebo-sim.md**
Walkthrough for launching and interacting with the **Gazebo simulation environment**.

### **run-sim-code.md**
Details on compiling, running, and debugging the **simulation control code** — including ROS 2 launch files and key parameters for tuning.

### **launch-f1tenth-gym/**
This directory includes scripts and notes for running the **F1TENTH Gym** environment (a Python-based racing simulator).

- **launch-f1tenth-gym.md** — Documentation for preconditions
- **launch-f1tenth-gym.sh** — Shell script to start the simulator  
- **test-launch.sh** — Quick test script for verifying setup

---

## 🧭 Purpose

This documentation set is meant to serve as a **living knowledge base** for our team and future contributors.  
It captures installation steps, tested configurations, and lessons learned while developing and simulating our F1TENTH car.

---

> Last updated: _October 2025_  
> Maintainers: Big Fish Co. Project Team

