#!/bin/bash

# Create new user.
useradd -m -G wheel,ssh -s /bin/bash max;

# Enable nftables.
systemctl enable --now nftables;

# Enable ssh.
systemctl enable --now sshd;

# Enabled docker when connection to socket is made.
systemctl enable --now docker.socket

ln -s /usr/bin/nvim /usr/bin/vi

# Install Yay.
git clone https://aur.archlinux.org/yay.git;
(cd yay; makepkg -si;);

# Create a tmux socket directory to enable sharing.
TMUX_DIR=/tmp/tmux-1000/
TMUX_GRP=tmux
groupadd $TMUX_GRP
usermod -aG $TMUX_GRP $USER

