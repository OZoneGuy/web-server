#!/bin/bash

if [ ! "`docker ps -a -f name=nginx`" ]; then
    docker run --name nginx \
           --mount type=bind,source="$(pwd)"/content,target=/usr/share/nginx/html,readonly \
           --mount type=bind,source="$(pwd)"/config,target=/etc/nginx/conf,readonly \
           -p 80:80 -d \
           nginx
elif [ "`docker inspect -f '{{.State.Running}}' nginx`" != 'true' ]; then
    docker start nginx
fi
