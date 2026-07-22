#!/bin/bash
os() {
    source /etc/os-release
    echo "$PRETTY_NAME"
}
kernel() {
    echo "$(uname -r)"
}
uptime() {
    awk '{print int($1/3600)"h "int(($1%3600)/60)"m"}' /proc/uptime
}
shell() {
    basename "$SHELL"
}
WM() {
    echo "$XDG_CURRENT_DESKTOP"
}
term() {
    echo "$TERM_PROGRAM"
}

cat <<EOF
Host:    lota
OS:      $(os)
Kernel:  $(kernel)
Shell:   $(shell)
Term:    $TERM
WM:      $(WM)
Uptime:  $(uptime)
EOF
