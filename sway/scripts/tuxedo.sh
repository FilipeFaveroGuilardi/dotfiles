#!/bin/bash

if ! swaymsg -t get_tree | grep -q '"app_id": "tuxedo"'; then
	kitty --class "tuxedo" -o allow_remote_control=yes tuxedo ~/notes/todo.txt

	while ! swaymsg -t get_tree | grep -q '"app_id": "tuxedo"'; do
		echo "w"
		sleep 0.1
	done

	swaymsg '[app_id="tuxedo"]' move window to scratchpad
	swaymsg '[app_id="tuxedo"]' scratchpad show
elif swaymsg -t get_tree | jq -e '.. | select(.focused? == true and .app_id? == "tuxedo")' >/dev/null 2>&1; then
    swaymsg '[app_id="tuxedo"]' move scratchpad
else
	swaymsg scratchpad show
fi
