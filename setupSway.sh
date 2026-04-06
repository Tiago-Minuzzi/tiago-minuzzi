#!/bin/bash

PKGS=(
  bluetui
  brightnessctl
  cliphist
  feh
  grim
  mako
  mate-polkit
  pavucontrol
  polkit
  rofi
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
