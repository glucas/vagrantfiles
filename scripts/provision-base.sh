#!/bin/bash

command_exists() { command -v "$1" &> /dev/null; }
export command_exists

## update OS

apt-get update
apt-get dist-upgrade
apt-get -y install build-essential linux-headers-$(uname -r)
apt-get install python-software-properties

## install some handy tools

# atop
apt-get -y install atop
echo "Installed: atop"

# ack
apt-get -y install ack-grep
if [ ! -f /usr/local/bin/ack ]; then
    ln -s `which ack-grep` /usr/local/bin/ack
fi
echo "Installed: $( ack-grep --version | grep ack-grep )"

# git - get the latest version
add-apt-repository -y ppa:git-core/ppa
apt-get update
apt-get -y install git
echo "Installed: $( git version )"

# gh (github)
if [ -z "$GH_DIST" ]; then
    GH_DIST=`find /host/shared -name gh_*_amd64.deb`
fi
echo "Installing gh from: $GH_DIST"
sudo dpkg -i $GH_DIST
