#!/bin/sh

set -e

. "./install.util.sh"

echo "Installing configs..."

install_config "./emacs"
install_config "./shell"
install_config "./alacritty"
install_config "./niri"
install_config "./fuzzel"
install_config "./dunst"
