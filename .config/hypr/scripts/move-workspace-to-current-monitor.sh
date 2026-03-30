#!/bin/bash

# Moves the given workspace to the current monitor, and then switches to that workspace

currentMonitorId=$(hyprctl activeworkspace | awk '/monitorID:/ {print $2;}')

hyprctl dispatch moveworkspacetomonitor $1 $currentMonitorId
hyprctl dispatch workspace $1
