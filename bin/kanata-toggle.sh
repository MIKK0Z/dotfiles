#!/usr/bin/env bash

if [ "$(systemctl --user is-active kanata.service)" = "active" ]; then
    systemctl --user stop kanata.service
else
    systemctl --user start kanata.service
fi
