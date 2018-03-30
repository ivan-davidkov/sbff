# firefox in a docker container
# the following line will start firefox in the container, thus
# video and sound will be played on the host machine
# docker run --rm \
#            -it \
#            -e DISPLAY \
#            -v /tmp/.X11-unix/:/tmp/.X11-unix \
#            -v /dev/snd:/dev/snd \
#            -e PULSE_SERVER="unix:/pulse" \
#            -v ${XDG_RUNTIME_DIR}/pulse/native:/pulse \
#            --group-add $(getent group audio | cut -d: -f3) \
#            local/alpine:firefox
FROM alpine:edge
MAINTAINER ivan@davidkov.eu

# add testing repo + install packages + add user and group
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
    && apk add --no-cache \
       dbus-x11 \
       ttf-freefont \
       firefox-esr \
       libcanberra-gtk2 \
       pulseaudio \
       mesa-gl \
       dumb-init \
    && rm -fr /var/cache/apk/* \
    && adduser -D -u 1000 -g 1000 user

# add user's work
WORKDIR /home/user

# switch to user
USER user

ENTRYPOINT ["/usr/bin/dumb-init", "/usr/bin/firefox", "--no-remote"]



