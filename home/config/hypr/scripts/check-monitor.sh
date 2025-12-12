#!/usr/bin/env bash
# TODO: Maybe not disable main monitor but jsut change something
# TODO: Execute it at Hyprland start

displays() {
  if [ "$1" = "monitoradded>>HDMI-A-1" ]; then
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "HDMI-A-1,1920x1080@120,auto,1"
  elif [ "$1" = "monitorremoved>>HDMI-A-1" ]; then
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
    hyprctl keyword monitor "HDMI-A-1,preferred,auto,1"
  fi
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do displays "$line" && sleep 0.1; done
