#!/bin/bash

readonly POWER_OFF="0"
readonly RESTART="1"
readonly LOCK="2"
readonly CANCEL=3

returned=`yad --title "Choose Power Off Option" --text "" --button "Power Off" --button "Restart" --button "Lock" --button "Cancel" --on-top --center; echo $?`

case $returned in
	
	$CANCEL)
		;;

	$POWER_OFF)
		shutdown now
		;;

	$RESTART)
		reboot
		;;

	$LOCK)
		xscreensaver-command -lock
		;;

	*)
		echo "Unkown"
		;;

esac
