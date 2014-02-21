#!/bin/bash

# install git:

apt-get -y install git

# also install hub: 

if [ ! -d /opt/hub ]; then
    git clone https://github.com/github/hub.git /opt/hub
    apt-get -y install rake
    cd /opt/hub
    rake install prefix=/usr/local
    cd -
fi

# basic git config: 

if [ -z "$GIT_USER" ]; then 
    GIT_USER="Greg Lucas"
fi

su -c "git config --global user.name \"$GIT_USER\"" vagrant

if [ -n "$GIT_EMAIL" ]; then
    su -c "git config --global user.email $GIT_EMAIL" vagrant
fi
