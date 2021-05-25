#!/usr/bin/env bash
# Install essentials and tools
sudo pacman -Sy i3-gaps \
                i3status \
                i3lock \
                feh \
                geoclue \
                redshift \
                lxappearance-gtk3 \
                lxsession-gtk3 \
                playerctl \
                unclutter \
                pcmanfm-gtk3 \
                qutebrowser \
                ranger \
                zathura \
                zathura-pdf-poppler \
                dunst --noconfirm
# Install pkgs from AUR
yay -S clipit \
       picom-ibhagwan-git \
       caffeine-ng --noconfirm
# Enable necessary services for redshift
sudo systemctl enable --now avahi-daemon.service &&\
sudo systemctl enable --now geoclue.service
