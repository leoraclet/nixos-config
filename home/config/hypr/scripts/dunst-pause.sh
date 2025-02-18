#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */
# /* Calculator (using qalculate) and rofi */
# /* Submitted by: https://github.com/JosephArmas */

count_waiting=$(dunstctl count waiting)
count_displayed=$(dunstctl count displayed)
enabled="{ \"text\": \" 󰂜 \", \"tooltip\": \"notifications <span color='#a6da95'>on</span>\", \"class\": \"on\" }"
disabled="{ \"text\": \" 󰪑 \", \"tooltip\": \"notifications <span color='#ee99a0'>off</span>\", \"class\": \"off\" }"

if [ $count_waiting != 0 ]; then
	enabled="{ \"text\": \" 󰂚 $count_displayed\", \"tooltip\": \"$count_displayed notifications\", \"class\": \"on\" }"
fi
if [ $count_displayed != 0 ]; then
	disabled="{ \"text\": \" 󰂛 $count_waiting\", \"tooltip\": \"(silent) $count_waiting notifications\", \"class\": \"off\" }"
fi

if dunstctl is-paused | rg -q "false"; then
	echo "$enabled"
else
	echo "$disabled"
fi
