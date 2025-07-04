#!/bin/bash

if hyprctl monitors | grep -q "DP-6"; then
  echo "Found external monitor"
  # found external monitor
  if [[ $1 == "open" ]]; then
    # lid is open
    hyprctl keyword monitor "eDP-1,preferred,auto,1.2"
  else
    # lid is closed
    hyprctl keyword monitor "eDP-1,disable"
  fi
else
  # did not find external monitor
  if [[ $1 == "close" ]]; then
    # lid is closed
    systemctl suspend
  fi

fi
