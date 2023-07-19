#!/bin/bash
set -e

# Stop the running container (if any)
containerid=`sudo docker ps | awk -F " " '{print $1}' | head -n 2 | tail -n 1`
sudo docker rm -f $containerid
