function install_alacritty() {
	$SCRIPT_INSTALL_COMMAND \
		alacritty

	config_dirs=(
		"alacritty"
	)
	link_folders "${config_dirs[@]}"
}
