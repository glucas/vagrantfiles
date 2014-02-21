#!/bin/bash

# Prerequisite to install docker on Ubuntu 12.04: update to kernel 3.8

apt-get -y update
apt-get -y install linux-image-generic-lts-raring linux-headers-generic-lts-raring

# reboot before going futher
# TODO: look at vagrant plugins that allow reboot during provisioning...

