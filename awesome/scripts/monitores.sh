#!/bin/sh
intern=eDP-1
extern=HDMI-1-0

if xrandr | awk -v o="$extern" '$1==o{f=1;next} /^[^ ]/{f=0} f && $1=="1920x1080"{found=1} END{exit !found}'; then
    xrandr --fb 5760x2400 --output "$extern" --mode 1920x1080 --pos 0x0 --rotate normal --output "$intern" --primary --mode 3840x2400 --pos 1920x0 --rotate normal
else
    xrandr --output "$extern" --off
    xrandr --fb 3840x2400 --output "$intern" --primary --mode 3840x2400 --pos 0x0
fi
