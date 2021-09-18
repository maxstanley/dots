function install_vncserver() {
	${SCRIPT_INSTALL_COMMAND} \
		tigervnc \
		xss-lock \
		light-locker \
		network-manager-applet \
		xorg-server \
		xorg-xinit

	$ROOT_COMMAND ufw allow 5901/tcp
}
