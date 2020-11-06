# docker-ros-build

Docker image with all dependencies to build the kitcar-ros workspaces

The source is available at KITcar's GitLab and a mirrored version at [GitHub](https://github.com/KITcar-Team/docker-ros-build), the build Docker image is available at [GitLab](https://git.kitcar-team.de/kitcar/docker-ros-build/container_registry).

## Get Docker Image

Download the docker image with

```bash
docker pull git.kitcar-team.de:4567/kitcar/docker-ros-build
```

## Build Docker Image

Build the Docker image with:

```bash
docker build -t  git.kitcar-team.de:4567/kitcar/docker-ros-build .
```

## Use the Docker Image to build kitcar-ros

Clone the kitcar/kitcar-ros repository somewhere
Then run a Docker container from the image:

```bash
docker run -it -v $PATH_TO_KITCAR_ROS:/kitcar git.kitcar-team.de:4567/kitcar/docker-ros-build
```

Inside the container, you can build with:

```bash
/kitcar/build_all.sh
```

## Update Docker Image

The Docker image will be updated after merging into the master branch at KITcar's GitLab. The image on the `master` branch is tagged as `latest`, other branches will create a Docker image tagged with the branch name

Because some of our GitLab Runners are low on hard drive memory, we should keep an eye on the size of the Docker image.
