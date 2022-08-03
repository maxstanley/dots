# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
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
alias vi="nvim"
alias vim="nvim"
 
alias   ls="exa --color=auto --long --header --binary --group --group-directories-first --time-style=long-iso"
alias   la="exa --color=auto --long --header --binary --group --group-directories-first --time-style=long-iso --all"
alias   ll="exa --color=auto --long --header --binary --group --group-directories-first --time-style=long-iso --all"
alias tree="exa --color=auto --long --header --binary --group --group-directories-first --time-style=long-iso --tree"

alias cat="bat"
alias cat="less"

alias rm='echo "Use rip"'
alias rip="rip --graveyard $HOME/.graveyard"

# Add rust nightly bin/ to PATH
export PATH=$PATH:$HOME/.rustup/toolchains/nightly-aarch64-unknown-linux-gnu/bin/

# Must stay at the end
eval "$(starship init zsh)"

