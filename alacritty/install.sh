# This file is not meant to be run directly. Instead,
# it should be sourced by the root `install.sh` script.

echo "Installing alacritty config..."

#
# Compile "scripts"
#

find_command cc
find_command tmux
find_command alacritty

cc -o ./config/scripts/terminal ./config/scripts/terminal.c

#
# Install alacritty config
#

link_path "$(pwd)/config" "${HOME}/.config/alacritty"
