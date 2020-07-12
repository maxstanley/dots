This is an example application that gets xeyes running on the local X Display.

docker build -t gui-xeyes .  
docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" gui-xeyes