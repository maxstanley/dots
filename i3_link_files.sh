#!/bin/bash

echo "Setting Up i3 dot files!"

dot_files=(
	".xinitrc"
)

config_dirs=(
	"latexmk"
	"i3"
	"i3status"
)

for file in "${dot_files[@]}"; do
	echo "Linking $HOME/.dots/$file to $HOME/$file"
	ln -sfn $HOME/.dots/$file $HOME/$file
done

mkdir -p $HOME/.config

for dir in "${config_dirs[@]}"; do
	ln -sfn $HOME/.dots/config/$dir $HOME/.config/
done

