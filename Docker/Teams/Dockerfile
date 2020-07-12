FROM debian:buster-20200511-slim

ENV VERSION 0.0.7
ENV XDG_CONFIG_HOME=/
RUN apt-get update &&\
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		gconf2 \
		gconf-service \
		libappindicator1 \
		libasound2 \
		libatk1.0-0 \
		libcairo2 \
		libcups2 \
		libexpat1 \
		libfontconfig1 \
		libfreetype6 \
		libgtk2.0-0 \
		libnotify4 \
		libnss3 \
		libpango-1.0-0 \
		libx11-xcb1 \
		libxcomposite1 \
		libxcursor1 \
		libxdamage1 \
		libxext6 \
		libxfixes3 \
		libxi6 \
		libxrandr2 \
		libxrender1 \
		libxss1 \
		libxtst6
        
RUN apt-get install -y  pulseaudio

RUN curl -sSL https://github.com/ivelkov/teams-for-linux/releases/download/v${VERSION}/teams-for-linux_${VERSION}_amd64.deb -o /tmp/teams.deb &&\
	dpkg -i /tmp/teams.deb &&\
	apt-get remove --purge -y curl ca-certificates && apt-get autoremove -y && rm -rf /tmp/* /var/lib/apt/lists/* &&\
	useradd -m teams && mkdir /teams-for-linux && chown teams:teams /teams-for-linux

RUN usermod -a -G audio teams
USER teams
ENTRYPOINT [ "teams" ]

# RUN apt-get update && \
#     apt-get install -y \
#     wget

# RUN cd /tmp && \
#     wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb

# RUN apt-get install -y /tmp/teams_1.3.00.5153_amd64.deb && \
#     rm /tmp/teams_1.3.00.5153_amd64.deb

# RUN apt-get install -y sudo

# # Replace 1000 with your user / group id
# RUN export uid=1000 gid=1001 && \
#     mkdir -p /home/developer && \
#     echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#     echo "developer:x:${uid}:" >> /etc/group && \
#     echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#     chmod 0440 /etc/sudoers.d/developer && \
#     chown ${uid}:${gid} -R /home/developer

# USER developer
# ENV HOME /home/developer

# CMD ["/usr/bin/teams", "1000"]