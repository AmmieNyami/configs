#!/bin/sh

set -e

. "./install.util.sh"

echo "Installing configs..."

install_config "./emacs"
install_config "./sway"
install_config "./shell"
install_config "./alacritty"
install_config "./i3blocks"
