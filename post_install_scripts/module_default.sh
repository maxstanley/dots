function install_default_packages() {
	$SCRIPT_INSTALL_COMMAND \
		git \
		htop \
		sudo \
		wget \
		man-db \
		man-pages

	$ROOT_COMMAND usermod -a -G wheel $DOT_USER	

	install_curl
	install_ssh
	install_tmux
	install_neovim
	install_zsh
}

function link_default_files() {
	dot_files=(
		".alias"
		".env"
	)
	link_files "${dot_files[@]}"
}

