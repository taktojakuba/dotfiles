#!/bin/bash
dir="$HOME/.config/"
in=(
  "$dir/yazi"
  "$dir/nvim"
  "$dir/ironbar"
  "$dir/mako"
  "$dir/rofi"
  "$dir/tmux"
  "$dir/foot"
  "$dir/btop"
  "$dir/cava"
  "$dir/matugen"
  "$HOME/.zshrc"
)
out="$HOME/dotfiles/"

for item in "${in[@]}"; do cp -rv "$item" "$out"; done
cp $dir/qutebrowser/config.py $out/qutebrowser 
cp $dir/qutebrowser/matugen.py $out/qutebrowser 
