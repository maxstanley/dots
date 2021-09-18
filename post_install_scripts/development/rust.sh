function install_rust {
	${SCRIPT_INSTALL_COMMAND} \
		curl
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /tmp/rustup.sh

	sh /tmp/rustup.sh \
		--default-host x86_64-unknown-linux-gnu \
		--default-toolchain stable \
		--profile default \
		-y

	rm /tmp/rustup.sh
}
