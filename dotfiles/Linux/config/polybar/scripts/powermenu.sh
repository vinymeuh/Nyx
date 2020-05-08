#!/bin/bash

rofi -show powermenu \
   -modi powermenu:~/.config/polybar/scripts/rofi-powermenu.sh \
   -lines 4 -width 20 \
   -font "Iosevka Nerd Font 12" \
   -xoffset -14 \
   -hide-scrollbar \
   -line-padding 4
