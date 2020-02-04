FROM ros:melodic-robot
LABEL name=docker-ros-build version=melodic

# remove this as soon as melodic-robot has been updated
RUN apt update && apt upgrade -y
RUN apt install wget -y

RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main" >> /etc/apt/sources.list.d/clang_7.list
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -

RUN apt update && apt install git ros-melodic-desktop ros-melodic-realtime-tools ros-melodic-tf2 \
 clang-7 clang-tidy-7 llvm-7 libomp-dev \
 ros-melodic-tf2-eigen ros-melodic-tf2-geometry-msgs ros-melodic-ackermann-msgs \
 ros-melodic-camera-calibration-parsers ros-melodic-camera-info-manager \
 ros-melodic-pcl-ros \
 ros-melodic-gazebo-ros-control ros-melodic-gazebo-ros-pkgs \
 libatlas-base-dev protobuf-compiler libprotobuf-dev ros-melodic-control-toolbox \
 unzip python-pip python-tk python-kitchen qtbase5-dev doxygen rsync -y

RUN apt-get install -y lcov ccache

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc; ln -s /usr/bin/ccache /usr/local/bin/g++; ln -s /usr/bin/ccache /usr/local/bin/cc; ln -s /usr/bin/ccache /usr/local/bin/c++
RUN ln -s /usr/bin/ccache /usr/local/bin/clang; ln -s /usr/bin/ccache /usr/local/bin/clang++

# works for both xenial and bionic
RUN echo "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" >> /etc/apt/sources.list.d/realsense-public.list
ADD realsense_repo.key /realsense_repo.key
RUN apt-key add /realsense_repo.key
RUN apt update && apt install -y librealsense2 librealsense2-dev

RUN apt install libzbar-dev -y

RUN apt install python-catkin-lint -y
