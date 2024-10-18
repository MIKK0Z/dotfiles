#!/bin/sh

hexcolor=$(hyprpicker)
rgbcolor=$(echo $hexcolor | sed 's/#//g' | xxd -r -p | od -An -tu1 | awk '{print $1,$2,$3}')

printf "hex: $hexcolor\nrgb: $rgbcolor" | tofi -c "$HOME/.config/tofi/small-config" | cut -b6- | wl-copy