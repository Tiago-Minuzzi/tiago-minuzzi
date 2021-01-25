# Minimal gnome 3 installation on Arch linux
pacman -S eog file-roller gdm gedit gnome-calculator gnome-calendar gnome-control-center gnome-disk-utility gnome-shell gnome-terminal gnome-tweaks mutter nautilus networkmanager python-nautilus sushi xdg-user-dirs-gtk --noconfirm
systemctl enable gdm.service
