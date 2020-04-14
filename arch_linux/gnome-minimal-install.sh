# Minimal gnome 3 installation on Arch linux
# sudo pacman -S xorg-server xorg-xinit xorg-server-utils xorg-twm xorg-xclock
# startx
sudo pacman -S gnome-shell gnome-shell-extensions gnome-disk-utility gnome-calendar gnome-software gnome-tweaks gnome-control-center --noconfirm
sudo systemctl enable gdm.service
