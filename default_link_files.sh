#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Incorrect Usage, requires path argument"
	exit 1
fi

DIR=$(echo $1 | sed 's:/*$::')
echo $DIR

if [ ! -d "$DIR" ]; then
	echo "Directory does not exist"
	exit 1
fi

CURRENT_FILE=$(basename $0)

if [ ! -f "$DIR/$CURRENT_FILE" ]; then
	echo "Not the dots directory"
	exit 1
fi

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
	# "alacritty"
)

script_files=(
	# "extract.sh"
	# "update_dots.sh"
	# "tmux_sessions.sh"
	# "tmux_socket.sh"
	# "tmux-sessions"
)

for file in "${dot_files[@]}"; do
	echo "Linking $DIR/$file to $HOME/$file"
	ln -sfn $DIR/$file $HOME/$file
done

mkdir -p $HOME/.config

for dir in "${config_dirs[@]}"; do
	ln -sfn $DIR/config/$dir $HOME/.config/
done

mkdir -p $HOME/.scripts

for script in "${script_files[@]}"; do
	ln -sfn $DIR/scripts/$script $HOME/.scripts/$script
done
