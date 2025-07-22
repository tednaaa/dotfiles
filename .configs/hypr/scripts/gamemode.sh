#!/bin/bash

path="$HOME/.config/hypr/tmp/gamemode-enabled"


if [ -f $path ]; then
    hyprctl reload
    rm $path
    notify-send "Gamemode deactivated" "Animations and blur enabled"
else
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    touch $path
    notify-send "Gamemode activated" "Animations and blur disabled"
fi
