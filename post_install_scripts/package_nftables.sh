function install_ssh() {
	$SCRIPT_INSTALL_COMMAND \
		nftables

	enable_service nftables
}

