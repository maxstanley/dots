#!/bin/bash

lock() {
    xscreensaver-command -lock
	sleep 1
    xset dpms force suspend
	systemctl suspend
}

"$@"
