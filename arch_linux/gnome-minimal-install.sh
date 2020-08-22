# Minimal gnome 3 installation on Arch linux
# pacman -S xorg xorg-server xorg-xinit xorg-apps xorg-drivers xdg-user-dirs
# startx
pacman -S gdm gnome-shell gnome-shell-extensions gnome-disk-utility gnome-calendar gnome-tweaks gnome-control-center --noconfirm
systemctl enable gdm.service
