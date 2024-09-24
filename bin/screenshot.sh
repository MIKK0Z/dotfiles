#!/bin/sh

CHOSEN=$(printf "Screen\nArea\nColor" | tofi -c "$HOME"/.config/tofi/small-config)

case "$CHOSEN" in
	"Screen") grim - | wl-copy ;;
	"Area") grim -g "$(slurp)" - | wl-copy ;;
	"Color") hyprpicker -a | tofi ;;
	* ) exit 1 ;;
esac
