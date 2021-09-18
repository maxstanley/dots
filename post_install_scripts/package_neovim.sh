function install_neovim() {
	$SCRIPT_INSTALL_COMMAND \
		neovim

	config_dirs=(
		"nvim"
	)
	link_folders "${config_dirs[@]}"

	install_python
	install_curl

	pip3 install --user neovim
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	nvim +PlugInstall +CocInstall \
		coc-actions \
		coc-angular \
		coc-clangd \
		coc-cmake \
		coc-css \
		coc-emmet \
		coc-eslint \
		coc-fzf-preview \
		coc-go \
		coc-html \
		coc-json \
		coc-python \
		coc-rls \
		coc-rome \
		coc-rust-analyzer \
		coc-sh \
		coc-snippets \
		coc-sql \
		coc-texlab \
		coc-todolist \
		coc-tsserver \
		coc-yaml \
		coc-yank \
		+qall
}
