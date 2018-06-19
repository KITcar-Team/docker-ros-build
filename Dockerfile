FROM ros:melodic-robot
LABEL name=docker-ros-build version=melodic

# remove this as soon as melodic-robot has been updated
RUN apt update && apt upgrade -y

RUN apt update && apt install git ros-melodic-desktop ros-melodic-realtime-tools ros-melodic-tf2 \
 clang-6.0 clang-tidy-6.0 llvm-6.0 libomp-dev \
 ros-melodic-tf2-eigen ros-melodic-tf2-geometry-msgs ros-melodic-ackermann-msgs \
 ros-melodic-camera-calibration-parsers ros-melodic-camera-info-manager \
 ros-melodic-pcl-ros \
 libatlas-base-dev protobuf-compiler libprotobuf-dev ros-melodic-control-toolbox \
 wget unzip python-pip python-tk python-kitchen qtbase5-dev -y

RUN apt-get install -y lcov ccache

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc; ln -s /usr/bin/ccache /usr/local/bin/g++; ln -s /usr/bin/ccache /usr/local/bin/cc; ln -s /usr/bin/ccache /usr/local/bin/c++
RUN ln -s /usr/bin/ccache /usr/local/bin/clang; ln -s /usr/bin/ccache /usr/local/bin/clang++

