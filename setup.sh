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

echo "Linking maxstanley/dots into $HOME/.dots/"

[[ -f $HOME/.dots/README.md ]] && echo "$HOME/.dots/ Already Exists." && echo "Please run update_dots to update configuration" && exit

rm -rf ~/.dots
ln -sfn $PWD $HOME/.dots

chmod +x $HOME/.dots/link_files.sh
$HOME/.dots/link_files.sh

echo "Setting Up NeoVIM"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

pip3 install --user neovim

nvim +PlugInstall +CocInstall coc-actions coc-angular coc-clangd coc-cmake coc-css coc-emmet coc-eslint coc-fzf-preview coc-go coc-html coc-json coc-python coc-rls coc-rome coc-rust-analyzer coc-sh coc-snippets coc-sql coc-texlab coc-todolist coc-tsserver coc-yaml coc-yank +qall

