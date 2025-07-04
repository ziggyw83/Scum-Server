FROM debian:bookworm-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV WINEARCH=win64
ENV WINEPREFIX=/opt/wine64

# Add 32-bit architecture for Wine
RUN dpkg --add-architecture i386

# Install dependencies
RUN apt update && \
    apt install -y \
      curl \
      ca-certificates \
      xvfb \
      wine64 \
      wine32 \
      libwine \
      libwine:i386 \
      winbind && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Install SteamCMD
RUN mkdir -p /opt/steamcmd && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" \
      | tar -xz -C /opt/steamcmd

# Set working directory for the server
WORKDIR /opt/scumserver

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Default startup command
CMD ["/start.sh"]
