# SandBox FireFox aka 'sbff'
Firefox in a docker container build on apline:edge

This is the Git repo of my [sbff](https://hub.docker.com/r/idavidkov/sandbox_firefox/). See [the Docker Hub page](https://hub.docker.com/r/idavidkov/) for the full readme on how to use this Docker image and for information regarding contributing and issues.

# Build your container

```console
docker build https://github.com/ivan-davidkov/sbff.git -t local/alpine:firefox 
```
the above line will tell docker to get the Dockerfile from github repo and after the build to tag `-t` it (name it) as local/alpine:firefox


# Starting a Firefox instance is simple:

start Firefox with video support only
```console
docker run --rm -it -e DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix idavidkov/sandbox_firefox
```
... where --rm will remove the container after you close the last window, -e DISPLAY will export your DISPLAY inside the container, -v /tmp/.X11-unix/:/tmp/.X11-unix will expose your running X server socket inside the container.

start Firefox with display and sound on the host
```console
docker run --rm -it -e DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v /dev/snd:/dev/snd --privileged idavidkov/sandbox_firefox
```
... where --rm will remove the container after you close the last window, -e DISPLAY will export your DISPLAY inside the container, -v /tmp/.X11-unix/:/tmp/.X11-unix will expose your running socket inside the container, -v /dev/snd:/dev/snd will connect your running sound system to the container /!\ but you also need to use --privileged option in order to get the sound running.
