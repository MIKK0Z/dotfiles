#!/usr/bin/env bash

if pgrep spotify > /dev/null; then
    playerctl -p spotify play-pause
else
    hyprctl dispatch exec spotify
fi

