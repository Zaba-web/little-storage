#!/bin/bash
kubectl set image deployment gateway gateway=zaba837/ls-user-service:$1
