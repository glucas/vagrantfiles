#!/bin/bash

# install minimal desktop on top of ubuntu server
apt-get install -y --no-install-recommends ubuntu-desktop

# default terminal font doesn't render well for me, so change it:
su -c "gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 13'" vagrant


# add vagrant user to admin group
usermod -a -G admin vagrant
