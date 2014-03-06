#!/bin/bash

## minimal user config for shell, git, etc

command_exists() { command -v "$1" &> /dev/null; }
export command_exists

# generate an ssh key
if [ ! -f $HOME/.ssh/config ]; then
    ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
fi

# generate inputrc
if [ ! -f $HOME/.inputrc ]; then
    cat <<"EOF" > $HOME/.inputrc
# search history
"\C-p": history-search-backward
"\C-n": history-search-forward
$if Bash
  # history expansion
  Space: magic-space
$endif
EOF
    echo "Generated file: $HOME/.inputrc"
fi

# basic git config
if command_exists git; then
    if [ -n "$GIT_NAME" ]; then
	git config --global user.name $GIT_NAME
    fi

    if [ -n "$GIT_EMAIL" ]; then
	git config --global user.email $GIT_EMAIL
    fi

    git config --global color.ui true
    git config --global log.abbrevCommit true
fi

# aliases
if ! grep -q "^# my aliases" $HOME/.bashrc; then
    echo -e '\n# my aliases' >> $HOME/.bashrc
    echo "alias ..='cd ..'" >> $HOME/.bashrc
    if command_exists gh; then
	echo 'eval "$(gh alias -s)"' >> $HOME/.bashrc
    fi
    echo "Updated file: $HOME/.bashrc"
fi
