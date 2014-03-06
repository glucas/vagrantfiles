#!bin/bash

if [ ! -f /usr/local/bin/gitsh ]; then
    echo "Installing gitsh..."
    if ! grep -q "ruby 2\." <(ruby -v); then
	source /host/provision/install-ruby.sh
    fi
    cd /tmp
    curl -O http://thoughtbot.github.io/gitsh/gitsh-0.4.tar.gz
    tar -zxf gitsh-0.4.tar.gz
    cd gitsh-0.4
    ./configure --prefix=/usr/local
    make
    make install
    cd -
fi

