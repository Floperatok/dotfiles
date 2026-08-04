#!/bin/sh

power_level=$(upower -d | grep percentage | head -n 1 | awk '{gsub("%","",$2); print $2}');
battery_state=$(upower -d | grep state | head -n 1 | awk '{print $2}')

if [ "$power_level" -lt 10 ]; then
    echo -n 󰂃
elif [ "$power_level" -lt 20 ]; then
    echo -n 󰁺
elif [ "$power_level" -lt 30 ]; then
    echo -n 󰁻
elif [ "$power_level" -lt 40 ]; then
    echo -n 󰁼
elif [ "$power_level" -lt 50 ]; then
    echo -n 󰁽
elif [ "$power_level" -lt 60 ]; then
    echo -n 󰁾
elif [ "$power_level" -lt 70 ]; then
    echo -n 󰁿
elif [ "$power_level" -lt 80 ]; then
    echo -n 󰂀
elif [ "$power_level" -lt 90 ]; then
    echo -n 󰂁
elif [ "$power_level" -lt 100 ]; then
    echo -n 󰂂
elif [ "$power_level" -eq 100 ]; then
    echo -n 󰁹
fi

if [[ "$battery_state" != "discharging" ]]; then
    echo -n 󱐋
    touch $HOME/.cache/discharge
elif [ "$power_level" -lt 15 ] && [ -f "$HOME/.cache/discharge" ]; then
    notify-send "Batterie faible !"
    rm $HOME/.cache/discharge
fi

echo $power_level%
