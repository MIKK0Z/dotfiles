#!/usr/bin/env bash

if [ "$(mullvad status | head -n 1)" = "Connected" ]; then
    mullvad disconnect
else
    mullvad connect
fi 

