#!/usr/bin/env sh

# Check whether to run each block
RUN_GIT=false
RUN_CLEAN=false

# Read command-line arguments
while getopts "gc" opt; do
  case $opt in
    g) RUN_GIT=true ;;
    c) RUN_CLEAN=true ;;
    *) echo "Usage: $0 [-g] [-c]"; exit 1 ;;
  esac
done

# 1. Git push (if requested)
if [ "$RUN_GIT" = true ]; then
  git add .
  git commit -m "Commit"
  git push
fi

# 2. Stop container
docker stop ldlamp-container

# 3. Cleanup (if requested)
if [ "$RUN_CLEAN" = true ]; then
  docker rm ldlamp-container  # Remove container
  docker rmi ldlamp:latest    # Remove image
  docker volume prune -f      # Remove all unused volumes
  docker network prune -f     # Remove all unused networks
  docker system prune -a -f   # Remove all Docker objects (containers, images, volumes, and networks)
fi

# 4. Build and Run
docker build -t ldlamp:latest -f ./Dockerfile .
docker run --name ldlamp-container -d -p "3000:80" ldlamp:latest
