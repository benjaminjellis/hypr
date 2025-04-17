#!/bin/bash

if hyprctl monitors | grep -q "DP-4"; then
  if [[ $1 == "open" ]]; then
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
  else
    hyprctl keyword monitor "eDP-1,disable"
  fi
else
  if [[ $1 == "close" ]]; then
    # no external monitor
    pidof hyprlock || hyprlock
    systemctl suspend
  fi

  echo "No monitor"
fi
