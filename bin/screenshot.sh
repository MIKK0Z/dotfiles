#!/bin/sh

CHOSEN=$(printf "Screen\nArea\nColor" | tofi -c "$HOME"/.config/tofi/small-config)

if [ "$CHOSEN" = "Color" ]; then
    sleep .3
fi

case "$CHOSEN" in
	"Screen") grim - | wl-copy ;;
	"Area") grim -g "$(slurp)" - | wl-copy ;;
	"Color") hyprpicker | tofi | wl-copy ;;
	* ) exit 1 ;;
esac
