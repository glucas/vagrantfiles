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
