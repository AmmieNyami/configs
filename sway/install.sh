# This file is not meant to be run directly. Instead,
# it should be sourced by the root `install.sh` script.

echo "Installing sway config..."

#
# Find required commands for the sway setup
#

# Obvious ones

find_command Xwayland
find_command i3blocks

# Commands for key bindings

find_command bemenu
find_command j4-dmenu-desktop

find_command dunst
find_command pactl

find_command wl-copy
find_command slurp
find_command grim

find_command thunar

if ! command -v "zoomer" 2>&1 >/dev/null; then
    echo "ERROR: command \`zoomer\` could not be found" >&2
    echo "NOTE: you can install \`zoomer\` from https://github.com/HatsuSixty/zoomer" >&2
    exit 1
fi

# Commands for startup

find_command dunst
find_command pipewire-pulse
find_command udiskie
find_command dex

#
# Install sway config
#

link_path "$(pwd)/config" "${HOME}/.config/sway"
