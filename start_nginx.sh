#!/bin/bash


if [ ! "`docker ps -aq -f name=nginx`" ]; then
    if [ "$#" -ne 1 ]; then
        echo "Container is not set up yet. Please pass root directory..."
        exit
    fi
    docker run --name nginx \
           --mount type=bind,source="$1"/content,target=/usr/share/nginx/html,readonly \
           --mount type=bind,source="$1"/docs-html,target=/usr/share/nginx/docs,readonly \
           --mount type=bind,source="$1"/config,target=/etc/nginx,readonly \
           -p 80:80 -d \
           nginx
elif [ "`docker inspect -f '{{.State.Running}}' nginx`" != 'true' ]; then
    docker start nginx
fi
