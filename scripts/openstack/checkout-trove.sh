#!/bin/bash

## Check out trove and create some virtual environments.

SOURCES=$HOME/source
mkdir -p $SOURCES

# enable virtualenvwrapper for current shell
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

if [ ! -d $SOURCES/trove ]; then
    git clone https://github.com/openstack/trove.git $SOURCES/trove
    mkvirtualenv -a $SOURCES/trove trove
    workon trove
    pip install greenlet
    pip install -r requirements.txt
    pip install -r test-requirements.txt
    add2virtualenv $SOURCES/trove
    deactivate; cd -
fi

if [ ! -d $SOURCES/python-troveclient ]; then
    git clone https://github.com/openstack/python-troveclient.git $SOURCES/python-troveclient
    mkvirtualenv -a $SOURCES/python-troveclient troveclient
    workon troveclient
    pip install -r requirements.txt
    pip install -r test-requirements.txt
    add2virtualenv $SOURCES/python-troveclient
    deactivate; cd -
fi
