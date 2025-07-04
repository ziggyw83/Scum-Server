# SCUM Dedicated Server (Docker + Wine)

This container runs a SCUM Dedicated Server using Wine 64-bit inside Docker on a Debian base.

## Quick Start

1. Build the image:
    docker-compose build

2. Run the server:
    docker-compose up 

3. Your SCUM data is saved in:
- ./scumdata (game install + config)
- ./wineprefix (persistent Wine environment)

Ports:
- 27015/udp
- 27016/udp
- 27020/tcp

Steam AppID: 3792580

