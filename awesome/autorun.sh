#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run picom --config /home/tiago/.config/picom/picom.conf
run setxkbmap -layout us -variant intl
run sxhkd -c /home/tiago/.config/sxhkd/sxhkdrc
run ~/.screenlayout/awesome.sh
run lxpolkit
run greenclip daemon
xset dpms 0 0 0 && xset s noblank  && xset s off
