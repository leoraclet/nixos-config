#!/usr/bin/env sh

if pgrep geoclue >/dev/null; then
	echo "{\"text\":\" 󰆤 \", \"tooltip\":\"Geopositioning\", \"alt\":\"Geo\"}"
fi
