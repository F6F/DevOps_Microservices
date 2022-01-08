#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=f66f/udacity:latest

# Step 2
# Run the Docker Hub container with kubernetes
#docker run -p 8000:80 -it $tag:latest bash 
kubectl create deployment --image=f66f/udacity:latest uda-app
kubectl set env deployment/uda-app  DOMAIN=cluster

# Step 3:
# List kubernetes pods
kubectl get pods --all-namespaces 

# Step 4:
# Forward the container port to a host
#kubectl expose deployment uda-app --port=8000 --target-port=80 --name=uda-app
#kubectl expose deployment uda-app --type=NodePort --name=uda-node --port=8000 --target-port=80
kubectl port-forward deployment/uda-app 8000:80
