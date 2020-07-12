#!/bin/bash

youtube() {
	if [[ $1 = "https://*" ]]; then
		mpv $1
	else
		mpv ytdl://ytsearchall:"$1"
	fi
}
