#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
set -e 

sudo docker pull pavanraj97/simple-python-flask-app:latest

# Run the Docker image as a container
sudo docker run -d -p 5000:5000 pavanraj97/simple-python-flask-app

echo
