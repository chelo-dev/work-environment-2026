#!/bin/bash
# Muestra layout actual en Hyprland
hyprctl devices -j | jq -r '.keyboards[]?.active_keymap' | head -n1
