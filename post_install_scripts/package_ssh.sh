function install_ssh() {
	$SCRIPT_INSTALL_COMMAND \
		openssh

	enable_service sshd
}

