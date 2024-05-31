 #!/bin/bash

kubectl apply -f ../users-db/users-db-config.yaml
kubectl apply -f ../users-db/users-db-pv.yaml
kubectl apply -f ../users-db/users-db-claim.yaml
kubectl apply -f ../users-db/users-db-deployment.yaml
kubectl apply -f ../users-db/user-db-service.yaml
kubectl apply -f ../users-service/k8s/user-deployment.yaml
kubectl apply -f ../users-service/k8s/user-service.yaml
