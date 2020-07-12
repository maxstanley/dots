#! /bin/bash

# Set some colors
red='\e[0;31m'
lpurp='\e[1;35m'
yellow='\e[1;33m'
NC='\e[0m' # No Color

# Create the Pulseaudio Socket
if [ ! -e /tmp/.slack-pulse-socket ];
then
    echo -e "${lpurp}Adding Pulseaudio socket at /tmp/.slack-pulse-socket${NC}" 
    PULSESOCKET=`pactl load-module module-native-protocol-unix socket=/tmp/.slack-pulse-socket`
fi

# Persistant cache and config 
CONTAINER=$USER-data
RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

# Launch slack container 
echo -e "${lpurp}Launching slack container${NC}" 
echo docker run --name slack \
  --env PULSE_SERVER=unix:/tmp/.slack-pulse-socket \
  --volume /tmp/.slack-pulse-socket:/tmp/.slack-pulse-socket \
  --net=host \
  --env="DISPLAY" \
  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --volume /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
  --volume ~/.config/slack:/root/.config/slack \
  -t gui-slack | sh

#   --volumes-from $CONTAINER \

# Clean up Pulseaudio socket
echo -e "${lpurp}Removing Pulseaudio socket at /tmp/.slack-pulse-socket${NC}" 
pactl unload-module $PULSESOCKET
docker rm slack
exit 0