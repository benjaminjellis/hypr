#!/bin/bash

if hyprctl monitors | grep -q "DP-4"; then
  if [[ $1 == "open" ]]; then
    echo 'monitor open w/ external'
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
  else
    echo 'monitro closed w/ external'
    hyprctl keyword monitor "eDP-1,disable"
  fi
else
  if [[ $1 == "close" ]]; then

    echo 'monitro closed w/o external'
    # no external monitor
    pidof hyprlock || hyprlock
    systemctl suspend
  else
    echo 'monitro open w/o external'
  fi

fi
