#!/usr/bin/env bash

cliphist list | rofi -dmenu -p "󰅌 cliphist" -theme ~/.config/rofi/cliphist/style.rasi | cliphist decode | wl-copy
