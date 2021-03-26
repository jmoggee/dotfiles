#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get network Interface
DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# Start polybar on all monitors
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  case $m in
    "DP-0") bar="main" ;;
    *) bar="secondary" ;;
  esac
  MONITOR=$m polybar -c ~/.config/polybar/config.ini $bar &
done
