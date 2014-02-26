#!/bin/bash

# python 
apt-get -y install python-dev python-pip 

# xml libs
apt-get -y install libxml2-dev libxslt-dev

# mysql libs
apt-get -y install mysql-client libmysqlclient-dev

# tox
pip install tox

# virtualenv
pip install virtualenv
pip install virtualenvwrapper

USER_BASHRC=/home/vagrant/.bashrc
if ! grep -q "virtualenvwrapper" $USER_BASHRC; then
    echo -e "\n# enable python virtualenvwrapper" >> $USER_BASHRC
    echo 'export WORKON_HOME=$HOME/.virtualenvs' >> $USER_BASHRC
    echo 'source /usr/local/bin/virtualenvwrapper.sh' >> $USER_BASHRC
    echo "[vagrantfiles] Updated file: $USER_BASHRC"
fi
