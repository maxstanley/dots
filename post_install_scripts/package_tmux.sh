function install_tmux() {
	$SCRIPT_INSTALL_COMMAND \
		tmux	

	config=(
		"tmux"
	)
	link_folders "${config[@]}"
}
