#!/bin/sh

CHOSEN=$(printf "Screen\nArea" | tofi -c "$HOME"/.config/tofi/small-config)

case "$CHOSEN" in
	"Screen") grim - | wl-copy ;;
	"Area") grim -g "$(slurp)" - | wl-copy ;;
	* ) exit 1 ;;
esac
