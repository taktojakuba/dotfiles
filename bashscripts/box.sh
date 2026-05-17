#!/bin/bash

#apply niri settings
sed -i '8c\include "./box.kdl"' ~/.config/niri/config.kdl
# apply noctalia settings
cp ~/.config/scripts/profiles/box.toml ~/.config/noctalia/config.toml