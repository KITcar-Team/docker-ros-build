FROM ros:kinetic-robot
MAINTAINER Marek Wehmer marek@wehmermail.net

RUN apt update && apt install git clang-format-3.6 ros-kinetic-desktop ros-kinetic-realtime-tools ros-kinetic-tf2 \
 ros-kinetic-tf2-eigen ros-kinetic-tf2-geometry-msgs ros-kinetic-ackermann-msgs ros-kinetic-ecl-core \
 libatlas-base-dev protobuf-compiler libprotobuf-dev ros-kinetic-control-toolbox wget unzip -y

