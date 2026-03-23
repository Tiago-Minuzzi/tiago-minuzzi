#!/bin/bash

LOW=20
CRITICAL=10
BAT="/sys/class/power_supply/BAT0"

warned_low=false
warned_critical=false

while true; do
  CAPACITY=$(cat $BAT/capacity)
  STATUS=$(cat $BAT/status)

  if [ "$STATUS" = "Discharging" ]; then
    if [ "$CAPACITY" -le "$CRITICAL" ] && [ "$warned_critical" = false ]; then
      notify-send -u critical "Bateria crítica!" "Restam ${CAPACITY}%"
      warned_critical=true
    elif [ "$CAPACITY" -le "$LOW" ] && [ "$warned_low" = false ]; then
      notify-send "Bateria baixa" "Restam ${CAPACITY}%"
      warned_low=true
    fi
  else
    warned_low=false
    warned_critical=false
  fi

  sleep 60
done
