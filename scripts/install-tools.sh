#!/bin/bash

apt-get -y install build-essential 

# ack
apt-get -y install ack-grep
ln -s `which ack-grep` /usr/local/bin/ack

# git and gh
apt-get -y install git
sudo dpkg -i /host/shared/installs/gh_2.0.0_amd64.deb 

