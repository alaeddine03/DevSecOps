#!/bin/bash
last=""
while true
do
  now=$(git ls-remote origin -h refs/heads/main | awk '{print $1}')
  if [ "$now" != "$last" ]; then
    git pull
    docker build -t lab1 .
    docker stop lab1c
    docker rm lab1c
    docker run -d --name lab1c -p 5000:5000 lab1
    last=$now
  fi
  sleep 15
done
