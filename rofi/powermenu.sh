#!/usr/bin/env bash

# Updated options with highly compatible, standard Nerd Font icons
options="󰈆  Exit i3\n󰤄  Suspend\n󰑓  Reboot\n󰐥  Shutdown"
# '-format d' tells Rofi to return ONLY the index number (1 for first row, 2 for second...)
# instead of the text string.
chosen=$(echo -e "$options" | rofi -dmenu -p "[ Computer ]" -format d)

# Match purely based on the row number selected
case "$chosen" in
1) i3-msg exit ;;
2) systemctl suspend ;;
3) systemctl reboot ;;
4) systemctl poweroff ;;
esac
