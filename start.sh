#!/usr/bin/bash

IMAGE_NAME='testy:testcase'
if [[ "$(docker images -q $IMAGE_NAME 2>/dev/null)" == "" ]]; then
	docker build -t $IMAGE_NAME .
fi

CONTAINER_ID=$(docker run -d -i -t \
	-v $(pwd)/src:/usr/local/src \
	$IMAGE_NAME /bin/bash)


docker attach $CONTAINER_ID && \
    docker ps -a -f ancestor=$IMAGE_NAME | \
    awk 'FNR >= 2 {print $1}' | \
    while IFS= read -r line; do
        docker rm $line
    done
