## Manual control
Before allowing the car to drive itself, we must ensure that the car can successfully drive at all using manual controls.

## Inspection
We must first inspect the vehicle to ensure we are ready to connect our controller.

1. Make sure the car is running off of the LIPO battery.
2. Plug the USB dongle receiver of the Logitech Joypad into the USB hub.
3. Make sure that the VESC is connected.
4. Ensure that both the car and laptop are connected to the internet.
5. Ensure tmux or some other program is installed which allows you to run multiple terminals over one SSH connection.

## Driving the Car
1. Open a terminal on the laptop and SSH into the car controller.
2. Launch teleop following the instructions found [here](https://f1tenth.readthedocs.io/en/foxy_test/getting_started/firmware/drive_workspace.html#doc-drive-workspace)
3. Hold the LB button on the controller to start controlling the car. Use the left joystick to move the car forward and backward and the right joystick for steering. If using the Logitech F710, make sure the switch at the back of the joystick is set to "D".

### Troubleshooting
- During teleop, if the joystick is not correctly mapped you can configure this in /f1tenth_ws/src/f1tenth_system/f1tenth_stack/config/joy_teleop.yaml
- If nothing happens, the driver name could be listening on the wrong port for the joystick. Double check the device_name parameter in joy_teleop.yaml. You can check the assigned name of the joystick by running ls /dev/input/*

