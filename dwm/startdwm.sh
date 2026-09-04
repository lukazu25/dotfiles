#!/bin/sh

xrandr -s 1920x1080
setxkbmap -layout us,ru,ge -option 'grp:alt_shift_toggle'
nitrogen --restore &
slstatus &
# For Cursor Use ~/.Xresources and xrdb -merge ~/.Xresources For Qt Apps qt5ct or qt6ct 
# In order for blueman-applet to work, start it after D-Bus and Polkit

while true; do
	# Log stderror to a file
	dwm 2>~/.dwm.log
	# No error logging
	#dwm >/dev/null 2>&1
done
