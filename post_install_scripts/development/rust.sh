function install_rust {
	${SCRIPT_INSTALL_COMMAND} \
		curl
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}
