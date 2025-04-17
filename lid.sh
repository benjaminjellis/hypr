#!/bin/bash

if hyprctl monitors | grep -q "DP-4"; then
  # found external monitor
  if [[ $1 == "open" ]]; then
    # lid is open
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
  else
    # lid is closed
    hyprctl keyword monitor "eDP-1,disable"
  fi
else
  # did not find external monitor
  if [[ $1 == "close" ]]; then
    # lid is closed
    pidof hyprlock || hyprlock
    systemctl suspend
  fi

fi
