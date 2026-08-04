#!/bin/sh

wifi_strength=$(nmcli -f IN-USE,SIGNAL,SSID device wifi | awk '/^\*/{print $2}');

if [ -z "${wifi_strength}" ]; then
    echo 󰤭
else
    if [[ $wifi_strength < 20 ]]; then
        echo 󰤯
    elif [[ $wifi_strength < 40 ]]; then
        echo 󰤟
    elif [[ $wifi_strength < 60 ]]; then
        echo 󰤢
    elif [[ $wifi_strength < 80 ]]; then
        echo 󰤥
    else
        echo 󰤨
    fi
fi

