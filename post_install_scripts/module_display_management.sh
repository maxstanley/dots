function install_display_manager {
	${SCRIPT_INSTALL_COMMAND} \
		i3-wm \
		i3status \
		xorg-server \
		xorg-xinit \
		xfce4-power-manager \
		lightdm-gtk-greeter \
		rofi \
		ttf-roboto-mono

	install_vncserver
	enable_service lightdm

	dirs=(
		"i3"
		"i3status"
	)
	link_folders "${dirs[@]}"

	files=(
		".xinitrc"
	)
	link_files "${files[@]}"

	install_alacritty
}

function install_vncserver() {
	${SCRIPT_INSTALL_COMMAND} \
		tigervnc \
		xss-lock \
		light-locker \
		network-manager-applet \
		xorg-server \
		xorg-xinit \
		xterm
}
