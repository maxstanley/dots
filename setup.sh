#!/bin/bash

echo "Checking dependencies..."

packages=(
	"/usr/bin/git"
	"/usr/bin/python"
	"/usr/bin/pip3"
	"/usr/bin/node"
)

for package in "${packages[@]}"; do
	[[ ! -f $package ]] && echo "$package" not found && exit
done

nodeMajorVersion=$(node --version | cut -d '.' -f1)
nodeMajorVersion="${nodeMajorVersion:1}"
nodeMinorVersion=$(node --version | cut -d '.' -f2)

[[ $nodeMajorVersion -lt 10 ]] && echo "Node Version must be greater than 10.12" && exit
[[ $nodeMajorVersion -eq 10 ]] && [[ $nodeMinorVersion -lt 12 ]] && echo "Node Version must be greater than 10.12" && exit

echo "Cloning maxstanley/dots into $HOME/.dots/"

[[ -f $HOME/.dots/README.md ]] && echo "$HOME/.dots/ Already Exists." && echo "Please run update_dots to update configuration" && exit

mkdir -p $HOME/.dots/
git clone git@github.com:maxstanley/dots.git $HOME/.dots/

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
	echo "Linking $HOME/.dots/$file to $HOME/$file"
	ln -sfn $HOME/.dots/$file $HOME/$file
done

config_dir=(
	"nvim"
)

for dir in "${config_dirs[@]}"; do
#	mkdir -p $HOME/.config/$dir
	ln -sfn $HOME/.dots/config/$dir $HOME/.config/$dir
done

echo "Setting Up NeoVIM"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

pip3 install --user neovim

nvim +PlugInstall +CocInstall coc-actions coc-angular coc-clangd coc-cmake coc-css coc-emmet coc-eslint coc-fzf-preview coc-html coc-json coc-python coc-rls coc-rome coc-sh coc-snippets coc-sql coc-todolist coc-tsserver coc-yaml coc-yank +qall

