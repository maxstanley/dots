#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Skip duplicate history on arrow up
HISTCONTROL=$HISTCONTROL:ignoredups

[[ -f $HOME/.alias ]] && . $HOME/.alias
[[ -f $HOME/.env ]] && . $HOME/.env

# [[ -f $HOME/.scripts/extract.sh ]] && . $HOME/.scripts/extract.sh
# [[ -f $HOME/.scripts/update_dots.sh ]] && . $HOME/.scripts/update_dots.sh
# [[ -f $HOME/.scripts/tmux_sessions.sh ]] && . $HOME/.scripts/tmux_sessions.sh

# Update NeoVIM Plugins
# called in subshell to prevent output 
(vim +PlugUpdate +qall +silent --headless 2> /dev/null &)

# [ -z "$TMUX" ] && exec tmux new-session -s $TMUX_SESSION
# chown -R $USER:$TMUX_GROUP $TMUX_DIRECTORY

