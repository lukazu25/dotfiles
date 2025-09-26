#!/bin/bash
# Adjust volume and show notification

pactl set-sink-volume @DEFAULT_SINK@ "$1"

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
mute_status=$(pactl get-sink-mute @DEFAULT_SINK@)

if [[ "$mute_status" == *"yes"* ]]; then
    notify-send "Volume" "Muted"
else
    notify-send "Volume" "Volume: $volume"
fi
