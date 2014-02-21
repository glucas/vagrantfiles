#!/bin/bash

# python 
apt-get -y install python-dev python-pip 

# xml libs
apt-get -y install libxml2-dev libxslt-dev

# mysql libs
apt-get -y install mysql-client libmysqlclient-dev

# virtualenv
pip install virtualenv
pip install virtualenvwrapper

# tox
pip install tox
