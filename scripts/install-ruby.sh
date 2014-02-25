#!/bin/bash

if [ ! -f /usr/local/bin/ruby ]; then

    if [ -z "$RUBY_DIST" ]; then
	RUBY_DIST=`find /host/shared -name ruby-*.tar.gz`
    fi

    if [ -f $PYCHARM_DIST ]; then
	apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
	echo "Installing ruby from: $RUBY_DIST"
	tar xfz $RUBY_DIST -C /tmp/
	RUBY_HOME=$(find /tmp -maxdepth 1 -type d -name 'ruby*')
	cd $RUBY_HOME
	./configure --prefix=/usr/local
	make
	make install
	update-alternatives --install /usr/bin/ruby ruby /usr/local/bin/ruby 500
	cd -
    fi

fi




