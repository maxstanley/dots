#! /bin/bash

# Set some colors
red='\e[0;31m'
lpurp='\e[1;35m'
yellow='\e[1;33m'
NC='\e[0m' # No Color

# Create the Pulseaudio Socket
if [ ! -e /tmp/.chrome-pulse-socket ];
then
    echo -e "${lpurp}Adding Pulseaudio socket at /tmp/.chrome-pulse-socket${NC}" 
    PULSESOCKET=`pactl load-module module-native-protocol-unix socket=/tmp/.chrome-pulse-socket`
fi

# Persistant cache and config 
CONTAINER=$USER-data
RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

# Launch chrome container 
echo -e "${lpurp}Launching chrome container${NC}" 
echo docker run --name chrome \
  --env PULSE_SERVER=unix:/tmp/.chrome-pulse-socket \
  --volume /tmp/.chrome-pulse-socket:/tmp/.chrome-pulse-socket \
  --net=host \
  --env="DISPLAY" \
  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --volume /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
  --volume ~/.config/chromium:/home/chrome/.config/chromium \
  -t gui-chrome | sh

#   --volumes-from $CONTAINER \


# Clean up Pulseaudio socket
echo -e "${lpurp}Removing Pulseaudio socket at /tmp/.chrome-pulse-socket${NC}" 
pactl unload-module $PULSESOCKET
docker rm chrome
exit 0