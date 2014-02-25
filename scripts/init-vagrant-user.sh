#!/bin/bash

command_exists() { command -v "$1" &> /dev/null; }

sudo usermod -a -G admin vagrant

# add host bin to path
if ! grep -q "/host/bin" $HOME/.profile; then
    echo -e '\nexport PATH=$PATH:/host/bin' >> $HOME/.profile
fi

# generate inputrc
if [ ! -f $HOME/.inputrc ]; then
    cat <<EOF > $HOME/.inputrc
# search history
"\C-p": history-search-backward
"\C-n": history-search-forward
$if Bash
  # history expansion
  Space: magic-space
$endif
EOF
fi

# basic git config
if command_exists git; then
    if [ -n "$GIT_USERNAME" ]; then
	git config --global user.name $GIT_USERNAME
    fi

    if [ -n "$GIT_EMAIL" ]; then
	git config --global user.email $GIT_EMAIL
    fi
fi

# aliases
if ! grep -q "^# my aliases" $HOME/.bashrc; then
    echo -e '\n# my aliases' >> $HOME/.bashrc
    echo "alias ..='cd ..'" >> $HOME/.bashrc
    if command_exists gh; then
	echo 'eval "$(gh alias -s)"' >> $HOME/.bashrc
    fi
fi
