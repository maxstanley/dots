function install_tmux() {
	$SCRIPT_INSTALL_COMMAND \
		tmux	

	dot_files=(
		".tmux.conf"
	)
	link_files "${dot_files[@]}"
}
