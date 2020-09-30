# Activate RPMFusion
## Free
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
## Non-free
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Common programs
sudo dnf install vim vim-airline ufw transmission-gtk tilix flameshot neofetch htop gnome-tweaks chromium timeshift vlc -y 
# Install mscorefonts2
sudo dnf install curl cabextract xorg-x11-font-utils fontconfig -y
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
# Dev tools
sudo dnf install gcc gcc-c++ kernel-devel make cmake automake zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel -y
