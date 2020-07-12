FROM debian:buster-20200511-slim

RUN apt-get update && apt-get install -y \
    apt-utils \
    dbus-x11 \
    dunst \
    hunspell-en-us \
    python3-dbus \
    software-properties-common \
    libx11-xcb1 \
    gconf2 \
    libgtk2.0-0 \
    libnotify4 \
    libxtst6 \
    libnss3 \
    gvfs-bin \
    xdg-utils \
    apt-transport-https \
    libappindicator1 \
    libasound2 \
    wget \
    pulseaudio \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.2-amd64.deb
RUN apt-get update
RUN apt-get install -y libgtk-3-0 
RUN apt-get install -y libappindicator3-1
RUN dpkg -i slack-desktop-4.4.2-amd64.deb
RUN rm slack-desktop-4.4.2-amd64.deb

# RUN useradd -m slack
# RUN usermod -a -G audio slack
# USER slack

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

CMD ["/usr/lib/slack/slack", "--no-sandbox"]