#!/bin/bash

# Get the list of monitors
MONITORS=$(hyprctl monitors | grep "Monitor " | awk '{print $2}' | tr -d ':')

# Define the default monitor (e.g., eDP-1 for laptops)
DEFAULT_MONITOR="eDP-1"

# Define the workspace you want to bind (e.g., workspace 2)
WORKSPACE_ID=20

# Loop through all monitors and bind the workspace to non-default ones
for MONITOR in $MONITORS; do
    echo "Monitor: $MONITOR"
    if [[ "$MONITOR" != "$DEFAULT_MONITOR" ]]; then
        echo "Binding workspace $WORKSPACE_ID to monitor $MONITOR"
        hyprctl dispatch workspace $WORKSPACE_ID
        hyprctl dispatch moveworkspacetomonitor "$WORKSPACE_ID" "$MONITOR"
    fi
done
