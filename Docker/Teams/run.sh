#! /bin/bash

# Set some colors
red='\e[0;31m'
lpurp='\e[1;35m'
yellow='\e[1;33m'
NC='\e[0m' # No Color

# Create the Pulseaudio Socket
if [ ! -e /tmp/.teams-pulse-socket ];
then
    echo -e "${lpurp}Adding Pulseaudio socket at /tmp/.teams-pulse-socket${NC}" 
    PULSESOCKET=`pactl load-module module-native-protocol-unix socket=/tmp/.teams-pulse-socket`
fi

# Persistant cache and config 
CONTAINER=$USER-data
RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

# Launch teams container 
echo -e "${lpurp}Launching teams container${NC}" 
echo docker run --name teamsa \
  --env PULSE_SERVER=unix:/tmp/.teams-pulse-socket \
  --volume /tmp/.teams-pulse-socket:/tmp/.teams-pulse-socket \
  --net=host \
  --env="DISPLAY" \
  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --volume ~/.config/teams-for-linux:/teams-for-linux \
  -t gui-teams | sh

#   --volumes-from $CONTAINER \


# Clean up Pulseaudio socket
echo -e "${lpurp}Removing Pulseaudio socket at /tmp/.teams-pulse-socket${NC}" 
pactl unload-module $PULSESOCKET
docker rm teams
exit 0
