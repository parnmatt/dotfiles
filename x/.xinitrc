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

# Custom keys and themes
setxkbmap -layout us -option ctrl:nocaps -option compose:ralt
[[ -x "$HOME/.Xmodmap" ]] && xmodmap "$HOME/.Xmodmap"
[[ -x "$HOME/.Xresources" ]] && xrdb -override "$HOME/.Xresources"

# Background image
[[ -x "$HOME/.fehbg" ]] && "$HOME/.fehbg" &

# Autolock screen after 10mins
[[ -x "$HOME/.config/lock/lock" ]] && \
    xautolock -time 10 -locker "$HOME/.config/lock/lock" &

# Sound
start-pulseaudio-x11

# Auto hide mouse pointer
unclutter &

# Activate numlock
numlockx &

# Start Window Manager
[[ -x "$HOME/.exec-wm" ]] && "$HOME/.exec-wm"
