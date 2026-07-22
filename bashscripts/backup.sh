#!/bin/bash

dir="$HOME/.config"
out="$HOME/Documents/dotfiles/"
cp -r "$dir/btop" "$out"
cp -r "$dir/cava" "$out"
cp -r "$dir/foot" "$out"
cp -r "$dir/noctalia" "$out"
cp -r "$dir/tmux" "$out"
cp -r "$dir/yazi" "$out"
cp -r "$dir/bashscripts" "$out"
cp "$HOME/.zshrc" "$out"
cp "$dir/starship.toml" "$out"
