#!/usr/bin/env bash

IFS=$'\t' read -r _ _ _ ws <<< "$1"
hyprctl dispatch workspace "$ws"

# IFS=$'\t' read -r addr _ _ ws <<< "$1"
#
# region=$(hyprctl clients -j | jq -r --arg addr "$addr" '.[] | select(.stableId==$addr) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
# if [[ ! -f "$XDG_RUNTIME_DIR/hypr/alttab/preview_$addr.png" ]]; then
#     grim -T "$addr" -g "$region" "$XDG_RUNTIME_DIR/hypr/alttab/preview_$addr.png"
# fi

# dim=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}
# chafa --animate false --dither=none -s "$dim" "$XDG_RUNTIME_DIR/hypr/alttab/preview_$addr.png"
