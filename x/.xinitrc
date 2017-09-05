#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if  [[ -d  /etc/X11/xinit/xinit.d ]]; then
  for f in /etx/X11/xinit/xinit.d.*; do
    [[ -x "$f" ]] && source "$f"
  done
  unset f
fi

# Start profile

[[ -x "$HOME/.xprofile" ]] && "$HOME/.xprofile"

# Start Window Manager
[[ -x "$HOME/.exec-wm" ]] && "$HOME/.exec-wm"
