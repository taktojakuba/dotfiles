#!/bin/bash

name=$(date +%Y-%m-%d_%H-%M-%S)
file="$HOME/Pictures/Screenshots/$name.png"

maim -g 1920x1080+1920+0 "$file"
notify-send -u low "$(basename "$file") saved"
