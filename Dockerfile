FROM ros:noetic-robot
LABEL name=docker-ros-build version=noetic

COPY required_packages .

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt upgrade -y && \
    xargs --arg-file=required_packages apt install -y && \
    apt clean autoclean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-11 main" >> /etc/apt/sources.list.d/clang_11.list && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc; \
    ln -s /usr/bin/ccache /usr/local/bin/g++; \
    ln -s /usr/bin/ccache /usr/local/bin/cc; \
    ln -s /usr/bin/ccache /usr/local/bin/c++; \
    ln -s /usr/bin/ccache /usr/local/bin/clang; \
    ln -s /usr/bin/ccache /usr/local/bin/clang++