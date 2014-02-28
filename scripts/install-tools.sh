#!/bin/bash

apt-get -y install build-essential 

# top flavors
apt-get -y install htop
apt-get -y install atop

# ack
apt-get -y install ack-grep
if [ ! -f /usr/local/bin/ack ]; then
    ln -s `which ack-grep` /usr/local/bin/ack
    echo "[vagrantfiles] Linked: /usr/local/bin/ack"
fi

# git
add-apt-repository -y ppa:git-core/ppa
apt-get -y update
apt-get -y install git

# gh (github)
if [ -z "$GH_DIST" ]; then
    GH_DIST=`find /host/shared -name gh_*_amd64.deb`
fi
echo "[vagrantfiles] Installing gh from: $GH_DIST"
sudo dpkg -i $GH_DIST

