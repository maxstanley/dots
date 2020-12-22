#!/bin/bash

yay -Sy \
	i3-wm \
	i3status \
	dmenu2 \
	xorg-server \
	xorg-xinit \
	ttf-roboto-mono \
	xfce4-power-manager \
	lightdm-gtk-greeter \
	alacritty \
	mpv

sudo systemctl enable --now lightdm
