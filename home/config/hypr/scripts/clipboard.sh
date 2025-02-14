#!/usr/bin/env sh

if pgrep clipse >/dev/null; then
	killall -s SIGINT clipse
else
	kitty --class clipse -e clipse
fi
