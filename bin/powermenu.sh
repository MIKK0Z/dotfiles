#!/usr/bin/env bash

CHOSEN=$(printf "Lock\nSuspend\nReboot\nShutdown" | rofi -dmenu -p ">" -theme "$HOME"/.config/rofi/config-small.rasi)

case "$CHOSEN" in
	"Lock") hyprlock ;;
    "Suspend") hyprlock & sleep 0.5; systemctl suspend ;;
	"Reboot") reboot ;;
	"Shutdown") shutdown now ;;
	*) exit 1 ;;
esac
