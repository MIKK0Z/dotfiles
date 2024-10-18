#!/bin/sh

CHOSEN=$(printf "Screen\nArea" | tofi -c "$HOME"/.config/tofi/small-config)

function screen () {
	grim - | wl-copy
	wl-paste -t image/png >> "$HOME"/Pictures/Screenshots/$(date +%s)_screen.png
}

function area () {
	grim -g "$(slurp)" - | wl-copy
	wl-paste -t image/png >> "$HOME"/Pictures/Screenshots/$(date +%s)_area.png
}

case "$CHOSEN" in
	"Screen") screen ;;
	"Area") area ;;
	* ) exit 1 ;;
esac
