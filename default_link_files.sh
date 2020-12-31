#!/bin/bash

echo "Setting Up Max Stanley's dot files!"

dot_files=(
	".alias"
	".bash_logout"
	".bash_profile"
	".bashrc"
	".env"
	".tmux.conf"
)

config_dirs=(
	"nvim"
	"alacritty"
)

script_files=(
	"extract.sh"
	"update_dots.sh"
	"tmux_sessions.sh"
	"tmux_socket.sh"
	"tmux-sessions"
)

for file in "${dot_files[@]}"; do
	echo "Linking $HOME/.dots/$file to $HOME/$file"
	ln -sfn $HOME/.dots/$file $HOME/$file
done

mkdir -p $HOME/.config

for dir in "${config_dirs[@]}"; do
	ln -sfn $HOME/.dots/config/$dir $HOME/.config/
done

mkdir -p $HOME/.scripts

for script in "${script_files[@]}"; do
	ln -sfn $HOME/.dots/scripts/$script $HOME/.scripts/$script
done
