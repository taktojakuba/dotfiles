#!/bin/bash

#apply niri settings
sed -i '8c\include "./round.kdl"' ~/.config/niri/config.kdl 
# apply noctalia settings
cp ~/.config/noctalia/profiles/blur/settings.json ~/.config/noctalia/