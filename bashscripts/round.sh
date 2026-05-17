#!/bin/bash

#apply niri settings
sed -i '8c\include "./round.kdl"' ~/.config/niri/config.kdl 
# apply noctalia settings
cp ~/.config/scripts/profiles/round.toml ~/.config/noctalia/config.toml