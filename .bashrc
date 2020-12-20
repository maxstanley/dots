#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Skip duplicate history on arrow up
HISTCONTROL=$HISTCONTROL:ignoredups

[[ -f $HOME/.alias ]] && . $HOME/.alias
[[ -f $HOME/.env ]] && . $HOME/.env

[[ -f $HOME/.scripts/extract.sh ]] && . $HOME/.scripts/extract.sh
[[ -f $HOME/.scripts/update_dots.sh ]] && . $HOME/.scripts/update_dots.sh

# Update NeoVIM Plugins
# called in subshell to prevent output 
(vim +PlugUpdate +qall +silent --headless &)

