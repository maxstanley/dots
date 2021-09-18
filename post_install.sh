#!/bin/bash

export ROOT_COMMAND="sudo "
export SCRIPT_INSTALL_COMMAND="${ROOT_COMMAND}pacman -S --noconfirm"
export DOTS_FOLDER="$HOME/.dots"

function source_files_in_folder() {
	for file in $1; do
		source $file
	done
}

source_files_in_folder ./helper_scripts/*.sh
source_files_in_folder ./post_install_scripts/*.sh
source_files_in_folder ./post_install_scripts/**/*.sh

install_default_packages
link_default_files
install_development
install_display_manager
