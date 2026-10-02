#!/bin/bash

name=$(date +%Y-%m-%d_%H-%M-%S)
file="$HOME/$name.png"

grim "$file"
notify-send -u low "$(basename "$file") saved"
wl-copy < $file
