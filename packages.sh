#/usr/bin/env bash
set -e
set -x

BIN_DIR="${HOME}/.local/bin"
TMP_DIR=$(mktemp -d)

mkdir -p "${BIN_DIR}"

pushd "${TMP_DIR}"

# neovim
# https://github.com/neovim/neovim/blob/master/INSTALL.md
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# bat
# https://github.com/sharkdp/bat/releases
curl -LO https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-musl_0.24.0_amd64.deb
sudo apt install -y ./bat-musl_0.24.0_amd64.deb
rm ./bat-musl_0.24.0_amd64.deb

# eza
# https://github.com/eza-community/eza/releases
curl -LO https://github.com/eza-community/eza/releases/download/v0.20.5/eza_x86_64-unknown-linux-musl.zip
unzip eza_x86_64-unknown-linux-musl.zip
mv eza "${BIN_DIR}"
rm eza_x86_64-unknown-linux-musl.zip

# ripgrep
# https://github.com/BurntSushi/ripgrep/releases
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep_14.1.1-1_amd64.deb
sudo apt install -y ./ripgrep_14.1.1-1_amd64.deb
rm ./ripgrep_14.1.1-1_amd64.deb

# fd
# https://github.com/sharkdp/fd/releases
curl -LO https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-musl_10.2.0_amd64.deb
sudo apt install -y ./fd-musl_10.2.0_amd64.deb
rm ./fd-musl_10.2.0_amd64.deb

# zoxide
# https://github.com/ajeetdsouza/zoxide/releases
curl -LO https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.6/zoxide_0.9.6-1_amd64.deb
sudo apt install -y ./zoxide_0.9.6-1_amd64.deb
rm ./zoxide_0.9.6-1_amd64.deb

# fzf
# https://github.com/junegunn/fzf/releases
curl -LO https://github.com/junegunn/fzf/releases/download/v0.55.0/fzf-0.55.0-linux_amd64.tar.gz
tar xzf fzf-0.55.0-linux_amd64.tar.gz
mv fzf "${BIN_DIR}"
rm fzf-0.55.0-linux_amd64.tar.gz

# uv
# https://github.com/astral-sh/uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# tmux
# https://github.com/tmux/tmux/wiki/Installing
sudo apt install -y libevent-dev ncurses-dev build-essential bison pkg-config libevent-2.1-7 ncurses-bin
curl -LO https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz
tar xzf tmux-3.5a.tar.gz
pushd tmux-3.5a
./configure
make && sudo make install
popd
rm tmux-3.5a.tar.gz

# fnm
# https://github.com/Schniz/fnm
curl -fsSL https://fnm.vercel.app/install | bash

# shell check
# https://github.com/koalaman/shellcheck
curl -LO https://github.com/koalaman/shellcheck/releases/download/v0.10.0/shellcheck-v0.10.0.linux.x86_64.tar.xz
tar xf shellcheck-v0.10.0.linux.x86_64.tar.xz
mv shellcheck-v0.10.0/shellcheck "${BIN_DIR}/"
rm -rf shellcheck-v0.10.0 shellcheck-v0.10.0.linux.x86_64.tar.xz

# lurk
# https://github.com/JakWai01/lurk/tree/main
curl -LO https://github.com/JakWai01/lurk/releases/latest/download/lurk-x86_64-unknown-linux-gnu.tar.gz
tar xzf lurk-x86_64-unknown-linux-gnu.tar.gz
mv lurk "${BIN_DIR}/"
rm -rf lurk-x86_64-unknown-linux-gnu.tar.gz

popd

rm -rf "${TMP_DIR}"
