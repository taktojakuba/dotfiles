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
  "$HOME/.zshrc"
)
out="$HOME/dotfiles/"

for item in "${in[@]}"; do cp -rv "$item" "$out"; done

