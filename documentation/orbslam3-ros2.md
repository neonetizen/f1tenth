These steps generally follow those in the https://github.com/UZ-SLAMLab/ORB_SLAM3 repository, with some minor changes due to compatibility issues and the original repository not regularly being maintained.  We will set up the workspace under the assumption that an Intel RealSense D435i RGB camera is used.

## Install dependencies

### System dependencies

Run the following commands:

```jsx
sudo apt update
sudo apt install -y \
build-essential cmake git \
libeigen3-dev libboost-dev \
libglew-dev libpython3-dev \
python3-dev python3-numpy \
libjpeg-dev libpng-dev libtiff-dev \
libavcodec-dev libavformat-dev libswscale-dev \
libtbb2 libtbb-dev
```

### Install RealSense SDK

In the home directory, run:

```jsx
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense
mkdir build && cd build
```

```jsx
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
sudo make install
```

### Pangolin

In your ORBSLAM workspace, run:

```jsx
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build && cd build
```

```jsx
cmake .. -DCMAKE_BUILD_TYPE=Release \
-DPANGOLIN_BUILD_PYTHON=OFF \
-DPANGOLIN_BUILD_TOOLS=OFF
```

```jsx
make -j$(nproc)
sudo make install
```

### OpenCV

In your ORBSLAM workspace, run:

```jsx
git clone https://github.com/opencv/opencv.git
cd opencv
mkdir build && cd build
```

```jsx
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_opencv_world=ON
make -j$(nproc)
sudo make install
```

## Build ORBSLAM3

**Important:** Do **not** build ORBSLAM3 regularly as in the documentation. The included build scripts are outdated. Instead, in your ORBSLAM workspace, run:

```jsx
git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git
cd ORB_SLAM3
mkdir build && cd build

cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -Drealsense2_DIR=/usr/local/lib/cmake/realsense2 \
    -DUSE_Pangolin=ON
    
make -j$(nproc)
```

## Run an example

To run an example using the Intel RealSense D435i RGB camera, run the following command:

```jsx
./Examples/RealSense/rs_rgbd Vocabulary/ORBvoc.txt config/RealSense_D435i.yaml
```