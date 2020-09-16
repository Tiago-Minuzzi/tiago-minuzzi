#!/usr/bin/env bash
# Install yay aur helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si &&
cd .. && rm -rf yay
