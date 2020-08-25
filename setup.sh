#!/bin/bash

echo "Cloning maxstanley/dots"

git clone git@github.com:maxstanley/dots.git

echo "Setting Up Max Stanley's dot files!"

files=(
	".alias"
	".bash_logout"
	".bash_profile"
	".bashrc"
	".env"
	".tmux.conf"
)

for file in "${files[@]}"; do
	echo "Copying $file to $HOME/$file"
	# cp dots/$file $HOME/$file
	cp $file $HOME/$file
done
