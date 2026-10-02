#!/bin/bash

set +e
justbar &>/dev/null &
#ironbar >/dev/null 2>&1 &
mako >/dev/null 2>&1 &
wbg ~/Pictures/Wallpapers/fav.jpg >/dev/null 2>&1 &

wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &
wl-paste --type text --watch cliphist store >/dev/null 2>&1 &
