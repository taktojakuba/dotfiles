#!/usr/bin/env bash
mode="${1:-dark}"
gsettings set org.gnome.desktop.interface gtk-theme ""
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-${mode}"