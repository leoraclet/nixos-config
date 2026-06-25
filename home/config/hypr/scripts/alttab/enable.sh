#!/usr/bin/env bash

hyprctl -q keyword animations:enabled true
mkdir -p "$XDG_RUNTIME_DIR/hypr/alttab"
hyprctl -q --batch "keyword animations:enabled false; keyword unbind ALT, TAB ; keyword unbind ALT SHIFT, TAB"
kitty --class alttab "$HOME/.config/hypr/scripts/alttab/alttab.sh" "$1"
