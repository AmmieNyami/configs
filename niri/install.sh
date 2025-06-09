# This file is not meant to be run directly. Instead,
# it should be sourced by the root `install.sh` script.

echo "Installing niri config..."

find_command niri

#
# Find required commands for the niri setup
#

# Obvious ones

find_command Xwayland

# Commands for key bindings

find_command dunst
find_command pactl

find_command nautilus

# Required for zoomer
find_command grim

if ! command -v "zoomer" 2>&1 >/dev/null; then
    echo "ERROR: command \`zoomer\` could not be found" >&2
    echo "NOTE: you can install \`zoomer\` from https://github.com/AmmieNyami/zoomer" >&2
    exit 1
fi

# Commands for startup

find_command dunst
find_command udiskie
find_command xwayland-satellite
find_command swww

#
# Install niri config
#

link_path "$(pwd)/config" "${HOME}/.config/niri"
