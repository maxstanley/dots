function install_display_manager {
	${SCRIPT_INSTALL_COMMAND} \
		i3-wm \
		i3status \
		xorg-server \
		xorg-xinit \
		xfce-power-manager \
		lightdm-gtk-greeter \
		rofi \
		ttf-roboto-mono

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
