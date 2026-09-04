#!/bin/bash
# baraction.sh for spectrwm status bar

## DISK
hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "HDD: $hdd"
}

## RAM
mem() {
  # Added "RAM: " label here for clarity now that the icon is gone
  mem=`free | awk '/Mem/ {printf "RAM: %dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "$mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU: $cpu%"
}

## VOLUME
vol() {
  vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
  echo -e "VOL: $vol"
}

## BATTERY
bat() {
  battery="$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)"

  if [ -z "$battery" ]; then
    echo "BAT: N/A"
  else
    echo -e "BAT: $battery%"
  fi
}

SLEEP_SEC=3
#loops forever outputting a line every SLEEP_SEC secs

while :; do
     echo "+@fg=1; $(cpu) +@fg=0; | +@fg=2; $(mem) +@fg=0; | +@fg=3; $(hdd) +@fg=0; | +@fg=4; $(vol) +@fg=0; | +@fg=2; $(bat) +@fg=0; |"
  sleep $SLEEP_SEC
done
