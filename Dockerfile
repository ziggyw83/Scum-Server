FROM debian:bookworm-slim

ENV WINEARCH=win64
ENV WINEPREFIX=/opt/wine64
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 &&     apt update &&     apt install -y wine64 wine32 libwine libwine:i386 winbind                    wget curl unzip ca-certificates                    libnss3 software-properties-common xvfb &&     apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/steamcmd &&     cd /opt/steamcmd &&     curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

WORKDIR /opt/scumserver

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
