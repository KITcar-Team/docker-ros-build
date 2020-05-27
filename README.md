# docker-ros-build

Docker image with all dependencies to build the kitcar-ros workspaces

The source is available at KITcar's Gitlab and a mirrored version at
[Github](https://github.com/KITcar-Team/docker-ros-build), the build docker
image is available at
[Dockerhub](https://hub.docker.com/r/kitcar/docker-ros-build/).
(only protected branches are mirrored)


## Get Docker Image

Download the docker image with

```
docker pull kitcar/docker-ros-build
```


## Build Docker Image

Build the docker image with:

```
docker build -t  kitcar/docker-ros-build .
```


## Use the Docker Image to build kitcar-ros

Clone the kitcar/kitcar-ros repository somewhere
Then run a docker container from the image:

```
docker run -it -v $PATH_TO_KITCAR_ROS:/kitcar kitcar/docker-ros-build
```

Inside the container, you can build with:

```
/kitcar/build_all.sh
```


## Update Docker Image

The Docker image will be updated after you push a new commit to a protected
branch at KITcar's Gitlab. The branch `master` is used for the tag `latest`,
other branches will create a Docker image tagged with the branch name.

Because some of our Gitlab Runners are low on hard drive memory, we should keep
an eye on the size of the Docker image.
