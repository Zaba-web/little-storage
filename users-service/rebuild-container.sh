#!/bin/bash

if [ -n "$1" ]
then
  docker build . -t zaba837/ls-user-service:$1
  docker push zaba837/ls-user-service:$1
else
  docker build . -t zaba837/ls-user-service
  docker push zaba837/ls-user-service
