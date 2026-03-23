#!/bin/bash

PKGS=(
  brightnessctl
  cliphist
  flameshot
  mako
  mate-polkit
  polkit
  sway
  swaybg
  swayidle
  swaylock
  wezterm
  wl-clipboard
  wmenu
  yazi
)

sudo pacman -S --needed --noconfirm ${PKGS[*]}
