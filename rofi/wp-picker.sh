#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Wallpaper directory not found!"
    exit 1
fi

MENU_ITEMS=""
while IFS= read -r img; do
    basename=$(basename "$img")
    MENU_ITEMS+="${basename}\x00icon\x1f${img}\n"
done < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \))

# Stays centered by leaving the window alone, only turning items into a clean array layout
SELECTED=$(echo -e "$MENU_ITEMS" | rofi -dmenu \
    -i \
    -p "󰸉 " \
    -show-icons \
    -theme-str '
        window { width: 1100px; }
        listview { columns: 5; lines: 1; fixed-columns: true; spacing: 10px; }
        element { orientation: vertical; width: 200px; padding: 5px; }
        element-icon { size: 200px; }
        element-text { enabled: false; }
    ')

if [ -n "$SELECTED" ]; then
    nitrogen --set-zoom-fill --save "$WALLPAPER_DIR/$SELECTED"
fi
