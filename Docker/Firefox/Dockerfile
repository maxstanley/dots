# FROM debian:buster-20200511-slim

# RUN apt-get update && \
#     apt-get install -y \
#     wget \
#     bzip2

# RUN cd /tmp && \
#     wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/76.0.1/linux-x86_64/en-US/firefox-76.0.1.tar.bz2

# RUN tar xjf /tmp/firefox-76.0.1.tar.bz2 && \
#     mv firefox /opt/firefox && \
#     rm /tmp/firefox-76.0.1.tar.bz2

# CMD ["/opt/firefox/firefox"]

FROM debian:buster-20200511-slim

RUN apt-get update && \
    apt-get install -y \
    wget \
    bzip2

RUN apt-get install -y iceweasel

RUN apt-get install -y  pulseaudio
RUN apt-get install -y packagekit-gtk3-module
RUN useradd -m firefox
RUN usermod -a -G audio firefox
USER firefox
CMD ["iceweasel"]