#!/bin/bash

# Change brightness
brightnessctl set "$1"

# Get current brightness
BRIGHTNESS=$(brightnessctl g)

# Get max brightness
MAX=$(brightnessctl m)

# Calculate brightness percentage
PERCENT=$(( BRIGHTNESS * 100 / MAX ))

# Send notification
notify-send "Brightness: ${PERCENT}%"
