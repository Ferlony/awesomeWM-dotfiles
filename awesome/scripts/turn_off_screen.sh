#!/bin/sh

sleep 0.5
xset dpms force off
while sleep 2; do
  [ "$(xprintidle)" -lt 2000 ] && break   
  xset dpms force off
done
