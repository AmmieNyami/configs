#!/bin/sh

set -e

. "./install.util.sh"

echo "Installing configs..."

# Apps
install_config "./emacs"
install_config "./shell"
install_config "./alacritty"

# Desktop environment
install_config "./niri"
install_config "./fuzzel"
install_config "./dunst"
install_config "./waybar"
