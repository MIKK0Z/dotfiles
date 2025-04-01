#!/usr/bin/env bash

isRunning="$(systemctl --user is-active kanata.service)"
echo "{\"class\":\"$isRunning\"}"
