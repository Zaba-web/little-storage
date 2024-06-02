#!/bin/bash
kubectl set image deployment user gateway=zaba837/ls-user-service:$1
