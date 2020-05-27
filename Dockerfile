FROM ros:noetic-robot
LABEL name=docker-ros-build version=noetic

# remove this as soon as melodic-robot has been updated
RUN apt update && apt upgrade -y
RUN apt install wget -y

COPY required_packages .
RUN apt update && DEBIAN_FRONTEND=noninteractive xargs --arg-file=required_packages apt install -y
 

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc; ln -s /usr/bin/ccache /usr/local/bin/g++; ln -s /usr/bin/ccache /usr/local/bin/cc; ln -s /usr/bin/ccache /usr/local/bin/c++
RUN ln -s /usr/bin/ccache /usr/local/bin/clang; ln -s /usr/bin/ccache /usr/local/bin/clang++

# works for both xenial and bionic
RUN echo "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" >> /etc/apt/sources.list.d/realsense-public.list
ADD realsense_repo.key /realsense_repo.key
RUN apt-key add /realsense_repo.key
RUN apt update && apt install -y librealsense2 librealsense2-dev

RUN apt install libzbar-dev -y

