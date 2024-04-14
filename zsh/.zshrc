# Lines configured by zsh-newuser-install
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dev/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey '^R' history-incremental-search-backward

# Add cargo binaries to path
source "$HOME/.cargo/env"

# Aliases
source "$HOME/.config/shell/aliases"

# env
source "$HOME/.config/shell/env"

# Add rust nightly bin/ to PATH
export PATH=$PATH:$HOME/.rustup/toolchains/nightly-aarch64-unknown-linux-gnu/bin/

# Must stay at the end
eval "$(starship init zsh)"

