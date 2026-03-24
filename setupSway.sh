#!/bin/bash

PKGS=(
  brightnessctl
  cliphist
  flameshot
  grim
  mako
  mate-polkit
  polkit
  slurp
  sway
  swaybg
  swayidle
  swaylock
  wezterm
  wl-clipboard
  wmenu
  xdg-desktop-portal-wlr
  yazi
)

sudo pacman -S --needed --noconfirm ${PKGS[*]}
