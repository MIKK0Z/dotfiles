#!/bin/sh

# cliphist list | tofi | cliphist decode | wl-copy

# CLIPHIST=$(cliphist list | sed "/^--/d")

#echo $CLIPHIST

rofi -modi clipboard:~/.config/rofi/modis/cliphits-img -show clipboard
