#!/bin/bash

cliphist list | awk '{ print $2 }' | rofi -dmenu -p "Clipboard:" | wl-copy
