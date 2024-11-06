#!/usr/bin/env bash

CHOSEN=$(printf "Full\nArea\nWindow" | rofi -dmenu -p ">" -theme "~/.config/rofi/config-small.rasi")

case "$CHOSEN" in
	"Full") screenshot-full.sh ;;
	"Area") screenshot-area.sh ;;
	"Window") screenshot-window.sh ;;
	* ) exit 1 ;;
esac
