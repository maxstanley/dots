# Turn Off Beeps
xset -b

# Load Bluetooth
pactl load-module module-bluetooth-discover

# Alt-Shift Toggle Between US and UK Keyboard
setxkbmap -layout us,gb -option grp:alt_shift_toggle

# XRDB The Terminal Config
xrdb ~/.Xresources

# Start Xscreensaver
xscreensaver -no-splash &

# Start OpenBox
# exec openbox-session
exec i3
