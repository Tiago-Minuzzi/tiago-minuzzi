if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || startx "$HOME/.xinitrc"
fi
