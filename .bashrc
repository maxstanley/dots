#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Skip duplicate history on arrow up
HISTCONTROL=$HISTCONTROL:ignoredups


[[ -f $HOME/.alias ]] && . $HOME/.alias

[[ -f $HOME/.scripts/extract.sh ]] && . $HOME/.scripts/extract.sh
