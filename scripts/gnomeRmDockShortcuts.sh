#!/usr/bin/env bash

WSNUM=(1 2 3 4 5 6 7 8 9)
for WSN in ${WSNUM[@]}
do
    gsettings set org.gnome.shell.keybindings switch-to-application-$WSN []
done
