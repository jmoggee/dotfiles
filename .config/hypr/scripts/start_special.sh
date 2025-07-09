#!/bin/bash

APP_CMD="$1"
APP_CLASS="$2"
WORKSPACE="$3"

eval "$APP_CMD" &

# Wait for the app's window to appear
while ! hyprctl clients -j | grep -q "\"class\": \"$APP_CLASS\""; do
    sleep 0.1
done

hyprctl dispatch movetoworkspace "special:$WORKSPACE"
hyprctl dispatch togglespecialworkspace "$WORKSPACE"
