# This file is not meant to be run directly. Instead,
# it should be sourced by the root `install.sh` script.

echo "Installing waybar config..."

find_command waybar

# Required for pulseaudio module
find_command pactl

link_path "$(pwd)/config" "${HOME}/.config/waybar"
