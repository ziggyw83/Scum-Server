#!/bin/bash
set -e

echo "[*] Initializing Wine..."
mkdir -p /opt/wine64
export WINEARCH=win64
export WINEPREFIX=/opt/wine64

if [ ! -d "$WINEPREFIX/drive_c" ]; then
    wineboot --init
    sleep 5
fi

echo "[*] Updating SCUM Server..."
/opt/steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType windows     +force_install_dir /opt/scumserver   +login anonymous   +app_update 3792580 validate     +quit

echo "[*] Launching SCUM Server..."
cd /opt/scumserver/SCUM/Binaries/Win64
wine64 SCUMServer.exe -log
