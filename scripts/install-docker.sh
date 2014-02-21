#!/bin/bash

# Prerequisite (precise): update kernel 

apt-get -y install curl
curl -s https://get.docker.io/ubuntu/ | sh

groupadd -f docker
usermod -a -G docker vagrant

