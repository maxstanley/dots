FROM debian:buster-20200511-slim

RUN apt-get update && \
    apt-get install -y \
    wget \
    bzip2

RUN apt-get install -y webex

RUN apt-get install -y  pulseaudio

RUN useradd -m webex
RUN usermod -a -G audio webex
USER webex
CMD ["webex"]