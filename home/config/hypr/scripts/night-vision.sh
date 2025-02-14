#!/usr/bin/env sh

if pgrep wlsunset >/dev/null; then
	killall -s SIGINT wlsunset
else
	wlsunset
fi
