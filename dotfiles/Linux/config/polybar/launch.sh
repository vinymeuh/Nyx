#!/bin/sh

# Terminate already running bar instances
pkill polybar

# launch top bar (for debug, use polybar -l info top)
polybar top -c ~/.config/polybar/config.ini >/dev/null 2>&1 &
