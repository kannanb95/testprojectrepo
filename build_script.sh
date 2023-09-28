#!/bin/bash

#git clone 
#git clone https://github.com/kannanb95/testprojectrepo.git

#to the cloned repo dir
cd testprojectrepo
#tagging the every changes with commit ID
VERSION=$(git log -1 --pretty=%h)
REPO="kannanb95/testprojectrepo:"
TAG="$REPO$VERSION"
LATEST="${REPO}latest"
BUILD_TIMESTAMP=$( date '+%F_%H:%M:%S' )

echo "Time: $BUILD_TIMESTAMP"
pwd

REMOTE=origin
BRANCH=main
git fetch
if [[ "$(git rev-parse $BRANCH)" != "$(git rev-parse "$REMOTE/$BRANCH")" ]]; then
echo "Found Changes"

# Run your script
git pull 
# Build the Docker image
docker build -t "$TAG" -t "$LATEST" --build-arg VERSION="$VERSION" --build-arg BUILD_TIMESTAMP="$BUILD_TIMESTAMP" . 

#build docker
#docker build -t testproject:latest .

#Authenticate to docker
docker login
#push docker
#docker push kannanb95/testproject:latest
docker push "$TAG"
docker push "$LATEST"

#stop the container
docker stop projectrepo_container
#remove the container
docker container rm projectrepo_container
#docker container
docker run -d --name projectrepo_container -p 8080:80 testproject
else
	echo "No changes on $REMOTE/$BRANCH"
fi 
