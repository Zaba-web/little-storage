 #!/bin/bash

kubectl apply -f ../users-db/users-db-config.yaml
kubectl apply -f ../users-db/users-db-pv.yaml
kubectl apply -f ../users-db/users-db-claim.yaml
kubectl apply -f ../users-db/users-db-deployment.yaml
kubectl apply -f ../users-db/user-db-service.yaml
