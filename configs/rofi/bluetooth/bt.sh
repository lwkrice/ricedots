#!/usr/bin/env bash

theme="$HOME/.config/rofi/bluetooth/style.rasi"
DEVICE_MAC=""  # add your bt's MAC adress here for quicker access

bt_powered=$(bluetoothctl show | grep -c "Powered: yes")
dev_connected=$(bluetoothctl info "$DEVICE_MAC" | grep -c "Connected: yes")

if [ "$bt_powered" -eq 1 ]; then
    power_opt="Bluetooth: turn off"
else
    power_opt="Bluetooth: turn on"
fi

if [ "$dev_connected" -eq 1 ]; then
    dev_opt="Device: disconnect"
else
    dev_opt="Device: connect"
fi

chosen=$(printf "%s\n%s\nbluetoothctl" "$power_opt" "$dev_opt" | rofi -dmenu -p "bt" -theme "$theme")

[ -z "$chosen" ] && exit

case "$chosen" in
    *"turn off"*)   bluetoothctl power off ;;
    *"turn on"*)    bluetoothctl power on ;;
    *"disconnect"*) bluetoothctl disconnect "$DEVICE_MAC" ;;
    *"connect"*)    bluetoothctl connect "$DEVICE_MAC" ;;
    "bluetoothctl") foot -e bluetoothctl ;;
esac
