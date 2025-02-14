#!/usr/bin/env sh

if pgrep rofi >/dev/null; then
	killall -s SIGINT rofi
else
	rofi -show window -show-icons
fi
