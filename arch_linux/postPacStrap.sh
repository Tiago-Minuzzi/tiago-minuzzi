#!/usr/bin/env bash
# Set disk name, hostname
DISK="sda"
HNAME="arch"
# Set timezone
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
# Generate /etc/adjtime
hwclock --systohc
# Set up locale
sed 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen &&
locale-gen &&
echo "LANG=en_US.UTF-8" > /etc/locale.conf &&
export LANG=en_US.UTF-8
# Set up network and host
echo $HNAME > /etc/hostname &&
echo "127.0.0.1\tlocalhost\n::1\tlocalhost\n127.0.1.1\t$HNAME.localdomain\t$HNAME" > /etc/hosts
# Create a new initramfs
mkinitcpio -P
# Get fastest mirror
reflector -c 'Brazil' -a 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist &&
pacman -Sy
# Install bootloader
pacman -S grub os-prober &&
grub-install /dev/$DISK
## In case of efi mode, comment the line above and uncomment line below
#pacman -S grub os-prober efibootmgr && grub-install --target=x86_64-efi --bootloader-id=grub --efi-directory=/boot/efi
#-------
# Install system packages
pacman -S mesa xdg-user-dirs fuse2 fuse3 ntfs-3g exfat-utils pulseaudio gvfs dkms haveged unrar unzip htop lsb-release polkit man-db man-pages firefox dialog wpa_supplicant dhcpcd pacman-contrib usbutils pciutils dosfstools mtools network-manager-applet networkmanager wireless_tools ttf-ubuntu-font-family ttf-dejavu ttf-bitstream-vera ttf-liberation ttf-font-awesome otf-font-awesome noto-fonts --noconfirm
# Activate networking service
systemctl enable NetworkManager.service
# Remember to create a user and then reboot
echo "---------------------------------------------------------"
echo "Please, create a user now, exit, unmount and then reboot."
echo "---------------------------------------------------------"