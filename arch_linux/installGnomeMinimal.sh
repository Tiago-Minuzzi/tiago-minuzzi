# Minimal gnome 3 installation on Arch linux
pacman -S gdm gnome-shell gnome-terminal gnome-control-center gnome-tweaks nautilus gnome-disk-utility gnome-calendar gnome-calculator eog sushi --noconfirm
systemctl enable gdm.service
