#!/bin/sh

function convert_color() {
    echo "$1"

    return $1
}

hyprpicker | tofi -c "$HOME"/.config/tofi/small-config | wl-copy

