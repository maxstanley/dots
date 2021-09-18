function install_ufw() {
	$SCRIPT_INSTALL_COMMAND \
		ufw	

	enable_service ufw

	$ROOT_COMMAND ufw --force enable
}

