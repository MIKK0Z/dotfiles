#!/usr/bin/env bash

if [ -z $1 ]; then
    echo "Usage: volume-down.sh <percentage>"
    exit 1
fi

if [ "$(pactl get-sink-mute 0 | cut -b7)" == "y" ]; then
    pactl set-sink-mute 0 false
fi


pactl set-sink-volume 0 -$1%