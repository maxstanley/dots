#!/bin/bash

source $HOME/.env
chmod 700 $TMUX_SOCKET

# current_group=$(stat -c "%G" /tmp/tmux-1000/ | tr -d '\n')
current_group=$(ls -ld $TMUX_SOCKET | cut -d ' ' -f4)
new_group=$USER

[[ $current_group == $USER ]] && chmod 770 $TMUX_SOCKET && new_group=$TMUX_GROUP

chown $USER:$new_group -R $TMUX_SOCKET

