#!/bin/bash

ZEN_STATE_FILE=$HOME/.hypr_zen_state

DEFAULT_GAPS_IN=3
DEFAULT_GAPS_OUT=6
DEFAULT_ROUNDING=6
DEFAULT_BORDER_WIDTH=2

ZEN_BORDER_WIDTH=1

# Function to enable zen mode
enable_zen_mode() {
    killall -SIGUSR1 waybar
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword decoration:rounding 0
    hyprctl keyword general:border_size $ZEN_BORDER_WIDTH
    echo "enabled" > "$ZEN_STATE_FILE"
}

# Function to disable zen mode
disable_zen_mode() {
    killall -SIGUSR1 waybar
    hyprctl keyword general:gaps_in $DEFAULT_GAPS_IN
    hyprctl keyword general:gaps_out $DEFAULT_GAPS_OUT
    hyprctl keyword decoration:rounding $DEFAULT_ROUNDING
    hyprctl keyword general:border_size $DEFAULT_BORDER_WIDTH
    echo "disabled" > "$ZEN_STATE_FILE"
}

# Function to initialize the state
initialize_state() {
    if [ ! -f "$ZEN_STATE_FILE" ]; then
        disable_zen_mode
    fi
}

# Check if this is being run at startup
if [ "$1" = "--startup" ]; then
    initialize_state
    exit 0
fi

# Toggle zen mode
if [ ! -f "$ZEN_STATE_FILE" ] || [ "$(cat "$ZEN_STATE_FILE")" = "disabled" ]; then
    enable_zen_mode
else
    disable_zen_mode
fi
