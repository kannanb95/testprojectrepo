#!/bin/bash

#git clone
git clone https://github.com/kannanb95/testprojectrepo.git

#to cloned repo
cd testprojectrepo

#build docker
docker build -t testproject .

#push docker
docker push kannanb95/testproject

#docker container
docker run -d -p 80:80 --name testproject_container rbkannan95/testproject

