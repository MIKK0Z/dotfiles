#!/usr/bin/env bash

if pgrep spotify >> /dev/null; then
    STATUS=$(playerctl -p spotify status)
    METADATA=$(playerctl -p spotify metadata --format "{{artist}}\r{{album}}\r{{title}}\r{{duration(position)}}/{{duration(mpris:length)}}")
    echo "{\"tooltip\":\"$STATUS\r$METADATA\"}"
else
    echo "{\"tooltip\":\"No spotify instance\"}"
fi

