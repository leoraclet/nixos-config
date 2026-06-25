#!/usr/bin/env bash
hyprctl -q dispatch submap alttab

address=$(hyprctl -j clients | jq -r 'sort_by(.focusHistoryID) | .[] | select(.workspace.id >= 0) | "\(.stableId)\t\(.title)\t\(.address)\t\(.workspace.id)"' |
	      fzf --color prompt:green,pointer:green,current-bg:-1,current-fg:green,gutter:-1,border:bright-black,current-hl:red,hl:red \
		  --cycle \
		  --sync \
		  --bind tab:down,shift-tab:up,start:"$1",double-click:ignore \
		  --wrap \
		  --delimiter=$'\t' \
		  --with-nth=2 \
		  --preview "$XDG_CONFIG_HOME/hypr/scripts/alttab/preview.sh {}" \
		  --preview-window=down:0% \
		  --layout=reverse |
	      awk -F"\t" '{print $3}')

if [ -n "$address" ] ; then
	hyprctl --batch -q "dispatch focuswindow address:$address ; dispatch alterzorder top"
fi

hyprctl -q dispatch submap reset
hyprctl reload config-only
