#!/bin/sh

CHOSEN=$(printf "Screen\nArea\nColor" | tofi -c "$HOME"/.config/tofi/small-config)

case "$CHOSEN" in
	"Screen") grim ;;
	"Area") grim -g "$(slurp)" ;;
	"Color") hyprpicker -a ;;
	* ) exit 1 ;;
esac
