#!/bin/bash

# initial value
wpctl get-volume @DEFAULT_SINK@ | awk '{ print $2 }'

# listener
pactl subscribe | grep --line-buffered sink | while read -r _; do
    wpctl get-volume @DEFAULT_SINK@ | awk '{ print $2 }'
done