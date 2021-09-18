function install_default_packages() {
	$SCRIPT_INSTALL_COMMAND \
		git \
		curl \
		htop \
		sudo \
		wget \
		man-db \
		man-pages \

	install_ssh
	install_tmux
	install_neovim
}

function link_default_files() {
	dot_files=(
		".alias"
		".env"
	)
	link_files "${dot_files[@]}"
}

