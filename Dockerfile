FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PLEX_VERSION='1.41.8.9834-071366d65'

RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    rm -rf /var/lib/apt/list/*

RUN wget https://downloads.plex.tv/plex-media-server-new/${PLEX_VERSION}/debian/plexmediaserver_${PLEX_VERSION}_amd64.deb -O plex.deb && \
    dpkg -i plex.deb && \
    apt-get install -f -y && \
    rm plex.deb

EXPOSE 32400/tcp 3005/tcp 8324/tcp 32469/tcp 1900/udp 32410/udp 32412/udp 32413/udp 32414/udp

VOLUME /config
VOLUME /transcode
VOLUME /data

CMD ["/usr/lib/plexmediaserver/Plex Media Server"]