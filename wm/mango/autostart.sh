#!/bin/bash

set +e 

noctalia >/dev/null 2>&1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1 &
~/.config/bashscripts/clipboardfix-wf.sh >/dev/null 2>&1 &

