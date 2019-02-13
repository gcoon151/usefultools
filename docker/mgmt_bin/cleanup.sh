#!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q| egrep -v "bfe825a49988|4e4f61893399|a81f63674c17")
