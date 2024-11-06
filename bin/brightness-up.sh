#!/usr/bin/env bash

if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Usage: brightness_up.sh <percentage>"
    exit 1
fi

brightnessctl set +$1%