#!/bin/bash
# Get current volume of the default sink
curr=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po "[0-9]+(?=%)" | head -n 1)

# Only increase if it's currently below 100
if [ "$curr" -lt 100 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +10%
    # Double check we didn't jump to 105% or 110%
    pactl set-sink-volume @DEFAULT_SINK@ 100%--
fi

# Refresh the status bar
killall -SIGUSR1 i3status
