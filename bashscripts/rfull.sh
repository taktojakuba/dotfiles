#!/bin/bash

#apply niri settings
sed -i '8c\include "./rfull.kdl"' ~/.config/niri/config.kdl 
# apply noctalia settings
cp ~/.config/scripts/profiles/rfull.toml ~/.config/noctalia/config.toml