#!/bin/bash

profiles=("power-saver" "balanced" "performance")

current=$(powerprofilesctl get)

for i in "${!profiles[@]}"; do
    if [[ "${profiles[$i]}" == "$current" ]]; then
        next=$(( (i + 1) % ${#profiles[@]} ))
        powerprofilesctl set "${profiles[$next]}"
        notify-send -u low "Switched to ${profiles[$next]}"
        exit
    fi
done