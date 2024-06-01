#!/bin/bash
kubectl set image deployment gateway gateway=zaba837/ls-gateway-service:$1
