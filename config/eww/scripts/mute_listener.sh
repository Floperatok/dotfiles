#!/bin/bash

# initial value
wpctl get-volume @DEFAULT_SINK@ | grep -q MUTED && echo  || echo 

# listener
pactl subscribe | grep --line-buffered sink | while read -r _; do
    if wpctl get-volume @DEFAULT_SINK@ | grep -q MUTED; then
        echo 
    else
        echo 
    fi
done