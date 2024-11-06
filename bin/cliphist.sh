#!/usr/bin/env bash

cliphist list | rofi -dmenu -p ">" -display-columns 2 | cliphist decode | wl-copy
