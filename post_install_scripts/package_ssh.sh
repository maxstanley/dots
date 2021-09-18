function install_ssh() {
	$SCRIPT_INSTALL_COMMAND \
		openssh

	enable_service sshd
	$ROOT_COMMAND usermod -a -G ssh $DOT_USER	
	ufw allow 22/tcp
}

