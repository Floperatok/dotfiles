#!/bin/sh

get_option() {
  hyprctl getoption decoration:"$1" | awk 'NR==1{print $2}'
}

set_option() {
  hyprctl --batch "\
    keyword decoration:active_opacity $1;\
    keyword decoration:inactive_opacity $2"
  exit
}

toggle_blur() {
  hyprctl "keyword decoration:blur:enabled $1"
}

if [ $(get_option active_opacity) = "0.000000" ]; then
  toggle_blur yes
  hyprctl reload
else
  toggle_blur no
  set_option 0 0
fi
