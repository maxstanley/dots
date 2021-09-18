function install_zsh() {
	$SCRIPT_INSTALL_COMMAND \
		zsh \
		starship

	dot_files=(
		".zshrc"
	)
	link_files "${dot_files[@]}"
}
