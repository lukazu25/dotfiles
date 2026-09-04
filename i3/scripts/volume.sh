#!/bin/bash

# Change volume
pactl set-sink-volume @DEFAULT_SINK@ "$1"

# Small delay to ensure volume change is registered
sleep 0.1

# Get current volume (extract first channel's percentage)
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n 1)

# Send notification
notify-send "Volume" "$VOL"
