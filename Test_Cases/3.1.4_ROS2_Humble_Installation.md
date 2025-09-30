# ROS2 Humble
ROS 2 Humble is an LTS distribution of ROS 2. All members of our team will use this distribution to ensure a shared software stack, interoperability, and reproducibility throughout the development cycle of our project.

## ROS 2 Humble Installation Guide
### Setup Locale and Sources
ROS 2 (and many of its tools) expect text encoding that supports a wide range of characters, so without UTF-8 weird errors may occur.
Check for UTF-8 by running:
```bash
locale
```
#### Expected Output:
If your locale is already set up correctly, you should see something like:
```bash
LANG=en_US.UTF-8
. . .
LC_ALL=en_US.UTF-8 
```
If your system doesn't already use UTF-8, fix it with:
```bash
sudo apt update && sudo apt install locales 
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8 
```
Re-run `locale` to confirm.

## Setup ROS 2 Sources
Because ROS 2 isn't in the default Ubuntu repositories, we need to add the official ROS 2 source.

First, enable the **Universe repo** which contains many required packages:
```bash
sudo apt install software-properties common
sudo add-apt-repository universe 
```
Then install the package that configures ROS 2 repositories automatically:
```bash 
sudo apt update && sudo apt install curl -y
export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb
```

## Update System & Install ROS 2 
Update system packages:
```bash 
sudo apt update && sudo apt upgrade
```
Now install ROS 2 depending on what you need:
- **Desktop**: includes RViz, demos, tutorials, etc.
```bash 
sudo apt install ros-humble-desktop
```
- **ROS Base:** minimal install
```bash 
sudo apt install ros-humble-ros-base
```
- **Dev tools:** Needed to build ROS packages yourself
```bash 
sudo apt install ros-dev-tools
```
#### Expected Output:
With correct install, you'll see `Setting up ros-humble-...` at the end without any errors 

## Environment Setup
ROS 2 binaries aren't automatically added to `PATH`, it must be sourced each time a new terminal is opened.
```bash
source /opt/ros/humble/setup.bash 
```
(Note that you can add this to the end of your `~/.bashrc` file to do this automatically)
#### Expected Output:
Run: 
```bash
ros2 --version
```
and you should get:
```nginx
ros2 (version)
```

## Verify Installation with Talker-Listener
To ensure nodes can communicate:
1. Run a **C++ talker:**
```bash
source /opt/ros/humble/setup.bash 
ros2 run demo_nodes_cpp talker
```
#### Expected Output:
```csharp 
[INFO] Publishing: 'Hello World: 1'
[INFO] Published: 'Hello World: 2'
. . .
```
2. Run a **Python listener:**
```bash 
source /opt/ros/humble/setup.bash 
ros2 run demo_nodes_py listener 
```
#### Expected Output: 
```less 
[INFO] I heard: [Hello World: 1]
[INFO] I heard: [Hello World: 2]
. . .
```
If you can see matching publish/subscribe logs, ROS 2 has been correctly set up!
