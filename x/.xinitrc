#!/bin/bash

if  [[ -d  /etc/X11/xinit/xinit.d ]]; then
  for f in /etx/X11/xinit/xinit.d.*; do
    [[ -x "$f" ]] && source "$f"
  done
  unset f
fi

# start profile
[[ -f "$HOME/.xprofile" ]] && "$HOME/.xprofile"

# start session
session=${1:-dwm}
case $session in
    dwm)
        exec dwm ;;
    i3|i3wm)
        exec i3 ;;
    # unknown, try executing as command
    *)
        exec $session ;;
esac
