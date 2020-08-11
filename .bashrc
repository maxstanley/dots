#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Skip duplicate history on arrow up
HISTCONTROL=$HISTCONTROL:ignoredups

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

[[ ! -f $HOME/.alias ]] || . $HOME/.alias
[[ ! -f $HOME/.env ]] || source $HOME/.env

[[ ! -f $HOME/.scripts/extract.sh ]] || source $HOME/.scripts/extract.sh
[[ ! -f $HOME/.scripts/youtube.sh ]] || source $HOME/.scripts/youtube.sh
[[ ! -f $HOME/.scripts/lock.sh ]] || source $HOME/.scripts/lock.sh
[[ ! -f $HOME/.scripts/load_work.sh ]] || source $HOME/.scripts/load_work.sh
