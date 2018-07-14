FROM ros:kinetic-robot
LABEL name=docker-ros-build version=latest

RUN apt update && apt install git clang-format-3.6 ros-kinetic-desktop ros-kinetic-realtime-tools ros-kinetic-tf2 \
 clang-4.0 clang-tidy-4.0 llvm-4.0 libomp-dev \
 clang-5.0 clang-tidy-5.0 llvm-5.0 \
 ros-kinetic-tf2-eigen ros-kinetic-tf2-geometry-msgs ros-kinetic-ackermann-msgs \
 ros-kinetic-camera-calibration-parsers ros-kinetic-camera-info-manager \
 libatlas-base-dev protobuf-compiler libprotobuf-dev ros-kinetic-control-toolbox \
 wget unzip python-pip python-tk -y

RUN apt-get install -y lcov ccache ros-kinetic-rosdoc-lite libpcl-registration1.7

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc; ln -s /usr/bin/ccache /usr/local/bin/g++; ln -s /usr/bin/ccache /usr/local/bin/cc; ln -s /usr/bin/ccache /usr/local/bin/c++
RUN ln -s /usr/bin/ccache /usr/local/bin/clang; ln -s /usr/bin/ccache /usr/local/bin/clang++

RUN apt install -y libopenblas-dev
RUN pip install slycot control scipy numpy

RUN echo "deb http://ppa.launchpad.net/adrozdoff/cmake/ubuntu xenial main" >> /etc/apt/sources.list.d/adrozdoff-ubuntu-cmake-xenial.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key 9bf48f7f3cec09857fb3c56e4b7e4b9010bbfe68
RUN apt update && apt install -y cmake

# works for both xenial and bionic
RUN echo "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" >> /etc/apt/sources.list.d/realsense-public.list
ADD realsense_repo.key /realsense_repo.key
RUN apt-key add /realsense_repo.key
RUN apt update && apt install -y librealsense2 librealsense2-dev
