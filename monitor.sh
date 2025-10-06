#!/bin/bash
while true
do
  clear
  echo "Building..."
  docker build -t lab1 .
  docker stop lab1c
  docker rm lab1c
  docker run -d --name lab1c -p 5000:5000 lab1
  echo "Waiting for changes..."
  sleep 10
done
