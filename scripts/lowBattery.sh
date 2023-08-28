#!/usr/bin/env bash
# To use this script
# Create a cronservice with the command
# crontab -e (may need to specify the editor: EDITOR=nvim crontab -e)
# and add
# */5 * * * * /home/tiago/.local/bin/lowBattery.sh (it sets to check battery every 5 min)

battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
low_threshold=20

if [ "$battery_level" -le "$low_threshold" ]; then
    dunstify -u critical "Low Battery" "Battery level is at ${battery_level}%."
fi

