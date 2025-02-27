#!/usr/bin/env sh

# Stop all running containers
docker stop $(docker ps -aq)

# Remove all containers
docker rm $(docker ps -aq)

# Remove all images
docker rmi $(docker images -q)

# Remove all unused volumes
docker volume prune -f

# Remove all unused networks
docker network prune -f

# Remove all Docker objects (containers, images, volumes, and networks)
docker system prune -a -f
