#!/bin/bash

echo "Start umount script"

dbus-monitor "member='InterfacesRemoved',path='/org/freedesktop/UDisks2',interface='org.freedesktop.DBus.ObjectManager'" --system |
while read -r line; do
    
    if [[ $line == *"mmcblk1p1"* ]]
    then
      echo "umount /home/hoel/SD"
      umount -l /home/hoel/SD
    fi

done
