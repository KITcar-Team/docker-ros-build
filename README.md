# docker-ros-build
Docker image with all dependencies to build the kitcar-ros workspaces

## Build Docker Image
Build the docker image with:
```
docker build -t  git.kitcar-team.de:4567/kitcar/docker-ros-build .
```

## Use the Docker Image to build kitcar-ros
Clone the kitcar/kitcar-ros repository somewhere
Then run a docker container from the image:
```
docker run -it -v $PATH_TO_KITCAR_ROS:/kitcar git.kitcar-team.de:4567/kitcar/docker-ros-build
```
Inside the container, you can build with:
```
/kitcar/build_all.sh
```

## Push Docker Image
After the Image has been updated you can push the docker image to the GitLab Container Registry with
```
 docker push git.kitcar-team.de:4567/kitcar/docker-ros-build
```
