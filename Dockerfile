FROM ros:kinetic-robot
MAINTAINER Marek Wehmer marek@wehmermail.net

RUN apt update && apt install git clang-format-3.6 ros-kinetic-desktop ros-kinetic-realtime-tools ros-kinetic-tf2 \
 ros-kinetic-tf2-eigen ros-kinetic-tf2-geometry-msgs ros-kinetic-ackermann-msgs ros-kinetic-ecl-core \
 clang-4.0 clang-tidy-4.0 llvm-4.0 libomp-dev \
 ros-kinetic-camera-calibration-parsers ros-kinetic-camera-info-manager \
 libatlas-base-dev protobuf-compiler libprotobuf-dev ros-kinetic-control-toolbox wget unzip -y

RUN apt-get install -y lcov ccache ros-kinetic-rosdoc-lite

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc; ln -s /usr/bin/ccache /usr/local/bin/g++; ln -s /usr/bin/ccache /usr/local/bin/cc; ln -s /usr/bin/ccache /usr/local/bin/c++
RUN ln -s /usr/bin/ccache /usr/local/bin/clang; ln -s /usr/bin/ccache /usr/local/bin/clang++
