#!/bin/bash

battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
low_threshold=20

if [ "$battery_level" -le "$low_threshold" ]; then
    dunstify -u critical "Low Battery" "Battery level is at ${battery_level}%."
fi

