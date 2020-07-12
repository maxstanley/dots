#! /bin/bash

# Set some colors
red='\e[0;31m'
lpurp='\e[1;35m'
yellow='\e[1;33m'
NC='\e[0m' # No Color

# Create the Pulseaudio Socket
if [ ! -e /tmp/.webex-pulse-socket ];
then
    echo -e "${lpurp}Adding Pulseaudio socket at /tmp/.webex-pulse-socket${NC}" 
    PULSESOCKET=`pactl load-module module-native-protocol-unix socket=/tmp/.webex-pulse-socket`
fi

# Persistant cache and config 
CONTAINER=$USER-data
RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

# Launch webex container 
echo -e "${lpurp}Launching webex container${NC}" 
echo docker run --name webex \
  --env PULSE_SERVER=unix:/tmp/.webex-pulse-socket \
  --volume /tmp/.webex-pulse-socket:/tmp/.webex-pulse-socket \
  --net=host \
  --env="DISPLAY" \
  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  -t gui-webex | sh

# Clean up Pulseaudio socket
echo -e "${lpurp}Removing Pulseaudio socket at /tmp/.webex-pulse-socket${NC}" 
pactl unload-module $PULSESOCKET
docker rm webex
exit 0