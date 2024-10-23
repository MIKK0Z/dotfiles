#!/bin/sh

if [ "$(systemctl --user is-active opentabletdriver.service)" = "active" ]; then
    systemctl --user stop opentabletdriver.service
else
    systemctl --user start opentabletdriver.service
fi