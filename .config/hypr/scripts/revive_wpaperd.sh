#!/bin/bash

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

# Exit if the Hyprland IPC socket is not found
if [ ! -S "$SOCKET" ]; then
    echo "Hyprland socket not found: $SOCKET"
    exit 1
fi

# Start listening to Hyprland monitor events
socat - UNIX-CONNECT:"$SOCKET" | while read -r line; do
    if echo "$line" | grep -qE "monitoradded"; then
        echo "Monitor event - ensuring wpaperd restarts cleanly"
        pkill -x wpaperd
        sleep 1
        wpaperd &
    fi
done
