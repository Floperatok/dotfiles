#!/bin/bash

NB_WORKSPACES=9;

print_workspaces() {
	echo -n "(box :class \"workspaces\" :orientation \"h\" :space-evenly true :halign \"start\""
	i=1
	active_workspace=$(hyprctl activeworkspace -j | jq '.id')
	while [ $i -le $NB_WORKSPACES ]; do
		if [ $i -eq $active_workspace ]; then
			echo -n "(button :class \"active_workspace workspace\" :onclick \"hyprctl dispatch workspace $i\" (label :text \"$i\" :class \"dot\")) "
		else
			echo -n "(button :class \"inactive_workspace workspace\" :onclick \"hyprctl dispatch workspace $i\" (label :text \"$i\" :class \"dot\")) "
		fi
		i=$((i + 1))
	done
	echo ")"
}

handle() {
	case $1 in
		workspacev2*)
			print_workspaces;;
		focusedmonv2*)
			print_workspaces;;
	esac
}

print_workspaces
# hyprland event listener
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done