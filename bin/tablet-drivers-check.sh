#!/usr/bin/env bash

isRunning="$(systemctl --user is-active opentabletdriver.service)"
echo "{\"class\":\"$isRunning\"}"