#!/bin/bash

# On a given interval swap the wallpapers on each monitor from WALLPAPER_DIR using hyprpaper.

interval=300
WALLPAPER_DIR=/home/eric/GoogleDrive/Photos/Wallpapers

MONITORS=$(hyprctl monitors | grep "^Monitor " | awk '{print $2}')

# Allow hyprpaper to start when doing start-hyprland, so that we have a wallpaper after we login
sleep 1

while true; do
  while IFS= read -r monitor; do
      IMG=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)
      hyprctl hyprpaper wallpaper "$monitor,$IMG"
  done <<< "$MONITORS"

  sleep $interval
done
