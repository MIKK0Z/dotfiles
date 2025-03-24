#!/usr/bin/env bash

isConnected="$(mullvad status | head -n 1)"
echo "{\"class\":\"$isConnected\"}"

