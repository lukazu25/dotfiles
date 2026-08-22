#!/bin/bash
# Adjust brightness and show notification

# Use brightnessctl (preferred)
if command -v brightnessctl >/dev/null 2>&1; then
    brightnessctl set "$1"
    current=$(brightnessctl | grep -oP '\d+%' | head -1)
    notify-send "Brightness" "Brightness: $current"

# Fallback to xbacklight if brightnessctl not available
elif command -v xbacklight >/dev/null 2>&1; then
    if [[ "$1" == *"+"* ]]; then
        xbacklight -inc "${1%\%}"
    else
        xbacklight -dec "${1%\%}"
    fi
    level=$(xbacklight -get | awk '{print int($1)}')
    notify-send "Brightness" "Brightness: ${level}%"
else
    notify-send "Brightness" "No brightness tool found (install brightnessctl or xbacklight)"
fi
