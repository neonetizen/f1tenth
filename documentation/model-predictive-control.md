## Model Predictive Control
This documentation discusses what model predictive control is, how we can implement a variation of it provided by nav2, and what pros and cons a model predictive controller provides as opposed to the current Stanley control.

## Preface: What is Model Predictive Control
Model predictive control (MPC) is a type of advanced control system that uses a model of a system, and all of its previous data, to predict its future behavior and calculate an optimal sequecnce of actions to achieve a desired outcome while still maintining system constraints. 

At each step of the process, the controller receives new measurements, and updates its current state. After every new action the process of prediction and optimization repeats itself. 

At its' core, Model Predictive Control works by repeatedly solving an optimization problem over a future horizon, and then applying only the first step of the optimal sequence, allowing it to take a relatively efficient course of action while still being able to adapt to complex real-time environments/inputs.

## Model Predictive Control vs Learning Model Predictive Control
While both of these names are very similar, they should not be confused and are not interchangeable. A model predictive control is, in theory, deterministic. It uses an explicit model to optimize control actions. Model predictive control excels at handling constraints and provides guarantees due to its explicit nature. 

On the other hand, learning model predictive control is a method of MPC that uses reinforcement learning to create a control policy through trial and error, without an explicit model. LMPC has the advantage of being able to more easily optimize complex systems, but struggles with explicit constraints and can be less robust to model errors. 

## Model Predictive Path Integral Controller
Luckily for us, we can test one method of model predictive control using a plugin for Nav2 called [nav2_mppi_controller](https://docs.ros.org/en/iron/p/nav2_mppi_controller/). Model Predictive Path Integral Control is just one variation of MPC, and may not work best for every scenario. In essence, MPPIC uses the previous best control solutions and the robot's current state and applies a set of randomly sampled perturbations from a Gaussain distribution, These noised controls are then simulated to generate a set of potential trajectory paths. These paths are then scored using  aset of plugin-based critic functions to find the best trajectory in the batch. This process is repeated multiple times and a converged solution is created which is then used as the basis of the next step's initial control. A powerful benefit to the choice of using MPPIC is allowing greater designer flexibility in behavior through the critic functions. 

If you'd like to read more about the model predictive path integral control algorithm itself, you can do so [here](https://ieeexplore.ieee.org/document/7487277).

## Pros and Cons
Pros:
- Higher accuracy and performance compared to Stanley.
- Can easily handle system constraints like speed limits.
- MPC is proactive rather than reactive.
- Can handle complex systems where inputs and outputs are coupled.
- Better at adapting to situations in real-time.

Cons:
- High computational cost, having to solve an optimization problem at each time step requires significant computational resources which can be too slow for some high-speed applications without the right hardware.
- More difficult to implement than the straightforward Stanley control.
- Requires a good model, the performance of MPC is dependent on the accuracy of the system model used.

## Utilizing the nav2_mppi_controller
The following is an example XML configuration file for use of the Nav2 MPPI Controller. Please visit the [documentation](https://docs.ros.org/en/iron/p/nav2_mppi_controller/) for more information on the individual parameters
```XML
controller_server:
  ros__parameters:
    controller_frequency: 30.0
    FollowPath:
      plugin: "nav2_mppi_controller::MPPIController"
      time_steps: 56
      model_dt: 0.05
      batch_size: 2000
      vx_std: 0.2
      vy_std: 0.2
      wz_std: 0.4
      vx_max: 0.5
      vx_min: -0.35
      vy_max: 0.5
      wz_max: 1.9
      iteration_count: 1
      prune_distance: 1.7
      transform_tolerance: 0.1
      temperature: 0.3
      gamma: 0.015
      motion_model: "DiffDrive"
      visualize: false
      TrajectoryVisualizer:
        trajectory_step: 5
        time_step: 3
      AckermannConstraints:
        min_turning_r: 0.2
      critics: ["ConstraintCritic", "CostCritic", "GoalCritic", "GoalAngleCritic", "PathAlignCritic", "PathFollowCritic", "PathAngleCritic", "PreferForwardCritic"]
      ConstraintCritic:
        enabled: true
        cost_power: 1
        cost_weight: 4.0
      GoalCritic:
        enabled: true
        cost_power: 1
        cost_weight: 5.0
        threshold_to_consider: 1.4
      GoalAngleCritic:
        enabled: true
        cost_power: 1
        cost_weight: 3.0
        threshold_to_consider: 0.5
      PreferForwardCritic:
        enabled: true
        cost_power: 1
        cost_weight: 5.0
        threshold_to_consider: 0.5
      # ObstaclesCritic:
      #   enabled: true
      #   cost_power: 1
      #   repulsion_weight: 1.5
      #   critical_weight: 20.0
      #   consider_footprint: false
      #   collision_cost: 10000.0
      #   collision_margin_distance: 0.1
      #   near_goal_distance: 0.5
      CostCritic:
        enabled: true
        cost_power: 1
        cost_weight: 3.81
        critical_cost: 300.0
        consider_footprint: true
        collision_cost: 1000000.0
        near_goal_distance: 1.0
      PathAlignCritic:
      PathAlignCritic:
        enabled: true
        cost_power: 1
        cost_weight: 14.0
        max_path_occupancy_ratio: 0.05
        trajectory_point_step: 3
        threshold_to_consider: 0.5
        offset_from_furthest: 20
        use_path_orientations: false
      PathFollowCritic:
        enabled: true
        cost_power: 1
        cost_weight: 5.0
        offset_from_furthest: 5
        threshold_to_consider: 1.4
      PathAngleCritic:
        enabled: true
        cost_power: 1
        cost_weight: 2.0
        offset_from_furthest: 4
        threshold_to_consider: 0.5
        max_angle_to_furthest: 1.0
        forward_preference: true
      # VelocityDeadbandCritic:
      #   enabled: true
      #   cost_power: 1
      #   cost_weight: 35.0
      #   deadband_velocities: [0.05, 0.05, 0.05]
      # TwirlingCritic:
      #   enabled: true
      #   twirling_cost_power: 1
      #   twirling_cost_weight: 10.0
```