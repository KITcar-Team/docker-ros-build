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
 wget unzip python-pip python-tk python-kitchen qtbase5-dev doxygen -y

RUN apt-get install -y ccache
RUN apt-get install -y gcc-8 g++-8; \
 update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 100; \
 update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 50; \
 update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 100; \
 update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 50; \
 update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/cpp-8 100; \
 update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/cpp-7 50; \
 update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/gcov-8 100; \
 update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/gcov-7 50; \
 update-alternatives --set g++ /usr/bin/g++-8; \
 update-alternatives --set gcc /usr/bin/gcc-8; \
 update-alternatives --set gcov /usr/bin/gcov-8; \
 update-alternatives --set cpp-bin /usr/bin/cpp-8

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc; ln -s /usr/bin/ccache /usr/local/bin/g++; ln -s /usr/bin/ccache /usr/local/bin/cc; ln -s /usr/bin/ccache /usr/local/bin/c++
RUN ln -s /usr/bin/ccache /usr/local/bin/clang; ln -s /usr/bin/ccache /usr/local/bin/clang++

# works for both xenial and bionic
RUN echo "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" >> /etc/apt/sources.list.d/realsense-public.list
ADD realsense_repo.key /realsense_repo.key
RUN apt-key add /realsense_repo.key
RUN apt update && apt install -y librealsense2 librealsense2-dev

RUN git clone https://github.com/linux-test-project/lcov.git
RUN cd lcov; make install

RUN apt install libzbar-dev -y
