#!/bin/bash

#git clone
git clone https://github.com/kannanb95/testprojectrepo.git

#to cloned repo
cd testprojectrepo

#build docker
docker build -t testproject:latest .

#Authenticate to docker
docker login
#push docker
docker push kannanb95/testproject:latest

#docker container
docker run -d -p 8088:80 rbkannan95/testproject

