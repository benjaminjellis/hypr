#!/bin/bash

if hyprctl monitors | grep -q "DP-4"; then
  if [[ $1 == "open" ]]; then
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
  else
    hyprctl keyword monitor "eDP-1,disable"
  fi
else
  echo "No monitor"
fi
