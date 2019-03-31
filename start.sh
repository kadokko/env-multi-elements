#!/bin/bash

docker network create --driver=bridge --subnet=172.16.0.0/16 elements-network
docker-compose down
docker-compose build;
docker-compose up -d --force-recreate;

