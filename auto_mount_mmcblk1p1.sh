#!/bin/bash

echo "Start mount script"

dbus-monitor "member='InterfacesAdded',path='/org/freedesktop/UDisks2',interface='org.freedesktop.DBus.ObjectManager'" --system |
while read -r line; do
    
    if [[ $line == *"mmcblk1p1"* ]]
    then
      echo "mount /dev/mmcblk1p1 /home/hoel/SD"
      mount /dev/mmcblk1p1 /home/hoel/SD
    fi

done
