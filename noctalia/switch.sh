#!/bin/bash

if [ "$1" = "box" ]; then
    cp ~/.config/noctalia/bars/box-bar.txt ~/.config/noctalia/bar.toml
    cp ~/.config/noctalia/bars/box-config.txt ~/.config/noctalia/config.toml
    cp ~/.config/mango/variants/box.conf ~/.config/mango/visual.conf
    mango -c ~/.config/mango/config.conf -p
elif [ "$1" = "capsule" ]; then
    cp ~/.config/noctalia/bars/capsule-bar.txt ~/.config/noctalia/bar.toml
    cp ~/.config/noctalia/bars/capsule-config.txt ~/.config/noctalia/config.toml
    cp ~/.config/mango/variants/capsule.conf ~/.config/mango/visual.conf
fi


