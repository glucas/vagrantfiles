#!/bin/bash

# install minimal desktop on top of ubuntu server
apt-get install -y --no-install-recommends ubuntu-desktop

# add vagrant user to admin group
usermod -a -G admin vagrant

# default terminal font doesn't render properly, so change it:
echo "gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 13'" >> /home/vagrant/.bashrc

# script to toggle text scale factor
TOGGLE_SCALE=/home/vagrant/bin/toggle-scale-factor.sh
if [ ! -f $TOGGLE_SCALE ]; then
    cat <<"EOF" > $TOGGLE_SCALE
#!/bin/bash
# Toggle text scale factor betwen 0.9 (laptop) and 0.7 (monitor)

CURRENT=`gsettings get org.gnome.desktop.interface text-scaling-factor`
CURRENT=${CURRENT:0:3}

NEW=0.9
if [ "$NEW" == "$CURRENT" ]; then
    NEW=0.7
fi

gsettings set org.gnome.desktop.interface text-scaling-factor $NEW

echo "Set text scaling factor to $NEW."
EOF
    chown vagrant:vagrant $TOGGLE_SCALE
    echo "Generated file: $TOGGLE_SCALE"
fi
