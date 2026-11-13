#!/usr/bin/env bash

# This script will autoconnect to previously paired bluetooth headphones.
# I assigned this script to a shortcut action bound to a key on my airmouse. This way, I can instantly connect my
#  headphones without having to use the UI.

DEVICE="00:00:00:00:00:00" # find your device id via "bluetoothctl devices"
NAME="Bluetooth Headphones"

osd() {
    qdbus-qt6 org.kde.plasmashell \
        /org/kde/osdService \
        org.kde.osdService.showText \
        audio-headphones \
        "$1" >/dev/null 2>&1 || true
}

osd "Connecting to $NAME…"

bluetoothctl power on >/dev/null 2>&1
sleep 1

OUTPUT=$(timeout 15s bluetoothctl connect "$DEVICE" 2>&1)

if grep -qiE "Connection successful|already connected" <<< "$OUTPUT"; then
    osd "$NAME connected"
    exit 0
else
    osd "Could not connect to $NAME"
    exit 1
fi