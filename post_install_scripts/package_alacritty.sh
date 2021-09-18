function install_alacritty() {
	$SCRIPT_INSTALL_COMMAND \
		alacritty

	config_dirs=(
		"alacritty"
	)
	link_files "${config_dirs[@]}"
}
