#!/bin/bash
kubectl set image deployment user user-service-app=zaba837/ls-user-service:$1
