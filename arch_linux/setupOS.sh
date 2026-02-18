#!/bin/bash

# yes_or_no function source - https://stackoverflow.com/a/29436423
# Posted by Tiago Lopo, modified by community. See post 'Timeline' for change history
# Retrieved 2026-02-17, License - CC BY-SA 3.0

function yes_or_no {
  while true; do
    read -p "$* [y/n]: " yn
    case $yn in
    [Yy]*) return 0 ;;
    [Nn]*)
      echo "Aborted"
      return 1
      ;;
    esac
  done
}

ARCH_PKGS=(
  alacritty
  eza
  flatpak
  gimp
  git
  htop
  inkscape
  libreoffice-fresh
  libreoffice-fresh-pt-br
  mpv
  neovim
  ripgrep
  timeshift
  tmux
  ttf-dejavu
  ttf-firacode-nerd
  ttf-jetbrains-mono-nerd
  virtualbox
  virtualbox-guest-iso
  virtualbox-host-modules-arch
  zoxide
  zsh
)

FLATPAKS=(
  app.zen_browser.zen
  com.logseq.Logseq
  com.simplenote.Simplenote
  de.haeckerfelix.Fragments
  org.gnome.World.PikaBackup
  org.onlyoffice.desktopeditors
)

FTPS_OPT=(
  com.mattjakeman.ExtensionManager
  com.rafaelmardojai.Blanket
  com.valvesoftware.Steam
  im.bernard.Memorado
  info.febvre.Komikku
  net.trowell.typesetter
  org.gnome.World.Citations
)

sudo pacman -S --needed --noconfirm ${ARCH_PKGS[*]} &&
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo &&
  flatpak install -y ${FLATPAKS[*]} &&
  yes_or_no "Instalar flatpaks opcionais?" && flatpak install -y ${FTPS_OPT[*]}
