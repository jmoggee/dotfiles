#!/bin/bash

APP_CMD="$1"
WORKSPACE="$2"
FILTER="$3"

eval "$APP_CMD" &

# Wait for the app's window to appear
while ! hyprctl clients -j | jq -e "map(select($FILTER)) | length > 0" >/dev/null; do
  sleep 0.1
done

hyprctl dispatch togglespecialworkspace "$WORKSPACE"
