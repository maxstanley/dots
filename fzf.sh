#!/usr/bin/env bash
set -e
set -x

git clone --depth 1 https://github.com/junegunn/fzf.git $XDG_DATA_HOME/fzf
$XDG_DATA_HOME/fzf/install --xdg
