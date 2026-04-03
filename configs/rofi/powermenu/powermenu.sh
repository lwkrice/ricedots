#!/usr/bin/env bash

theme="$HOME/.config/rofi/powermenu/style.rasi"

uptime_info=$(uptime -p | sed 's/up //' | tr -d ',')  

options=" Shutdown\n Reboot\n Logout"

chosen=$(echo -e "$options" | rofi -dmenu -p "" -mesg "  Uptime : $uptime_info" -theme "$theme")

[ -z "$chosen" ] && exit

case "$chosen" in
    *Shutdown*) systemctl poweroff ;;
    *Reboot*)   systemctl reboot ;;
    *Logout*)   bspc quit ;;  # replace with your WM logout command
esac
