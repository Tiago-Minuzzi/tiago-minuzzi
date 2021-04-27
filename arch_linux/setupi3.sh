#!/usr/bin/env bash
# Install essentials and tools
sudo pacman -Sy i3-gaps \
               i3status \
               i3lock \
               feh \
               redshift \
               lxappearance \
               lxsession \
               picom \
               playerctl \
               dunst --noconfirm
# Install pkgs from AUR
yay -S clipit \
       caffeine-ng --noconfirm
# Enable necessary services for redshift
sudo systemctl enable --now avahi-daemon.service &&\
sudo systemctl enable --now geoclue.service
