#!/bin/bash

export ROOT_COMMAND="sudo "
export SCRIPT_INSTALL_COMMAND="${ROOT_COMMAND}pacman -S --noconfirm --needed"
export DOTS_FOLDER="$HOME/.dots"

function source_all_files() {
	for file in $DOTS_FOLDER/helper_scripts/*.sh; do
		echo "Sourcing $file"
		source $file
	done

	for file in $DOTS_FOLDER/post_install_scripts/*.sh; do
		echo "Sourcing $file"
		source $file
	done

	for file in $DOTS_FOLDER/post_install_scripts/**/*.sh; do
		echo "Sourcing $file"
		source $file
	done
}

source_all_files

install_zsh
# install_default_packages
# link_default_files
# install_development
# install_display_manager
