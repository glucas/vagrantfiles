#!/bin/bash

# this should be run as user 'vagrant'

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

