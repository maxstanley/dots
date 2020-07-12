FROM debian:buster-20200511-slim

RUN apt-get update && \
    apt-get install -y \
    wget

# RUN cd /tmp && \
#     wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# RUN apt-get install -y /tmp/google-chrome-stable_current_amd64.deb && \
#     rm /tmp/google-chrome-stable_current_amd64.deb
RUN apt-get install -y chromium
RUN apt-get install -y  pulseaudio
RUN useradd -m chrome
RUN usermod -a -G audio chrome
USER chrome

CMD ["chromium", "--no-sandbox", "--ignore-gpu-blacklist"]