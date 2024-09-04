#!/bin/sh

CHOSEN=$(printf "Lock\nReboot\nShutdown" | tofi --config "$HOME"/.config/tofi/small-config)

case "$CHOSEN" in
	"Lock") hyprlock ;;
	"Reboot") reboot ;;
	"Shutdown") shutdown now ;;
	*) exit 1 ;;
esac
