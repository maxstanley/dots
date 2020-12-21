#!/bin/bash

# Create new user.
useradd -m -G wheel,ssh -s /bin/bash max;

# Enable nftables.
systemctl enable --now nftables;

# Enable ssh.
systemctl enable --now sshd;

# Install Yay.
git clone https://aur.archlinux.org/yay.git;
(cd yay; makepkg -si;);

