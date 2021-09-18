function enable_service {
	$ROOT_COMMAND systemctl enable --now $1
}
