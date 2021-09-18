function install_zsh() {
	$SCRIPT_INSTALL_COMMAND \
		zsh \
		starship

	dot_files=(
		".zshrc"
	)
	link_files "${dot_files[@]}"

	config_files=(
		"starship.toml"
	)
	link_folders "${config_files[@]}"

	$ROOT_COMMAND usermod --shell /bin/zsh $DOT_USER
}
