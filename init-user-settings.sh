#!/bin/bash

# start emacs daemon at login
if ! grep -q "emacs --daemon" $HOME/.profile; then
    echo -e '\n# start emacs server at login' >> $HOME/.profile
    echo 'ps | grep -q emacs || emacs --daemon' >> $HOME/.profile
fi

# add host's shared bin to PATH
if ! grep -q "/host/bin" $HOME/.bashrc; then
    echo -e '\nexport PATH=$PATH:/host/bin' >> $HOME/.bashrc
fi
