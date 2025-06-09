# This file is not meant to be run directly. Instead,
# it should be sourced by the root `install.sh` script.

echo "Installing emacs config..."

find_command emacs

link_path "$(pwd)/config" "${HOME}/.config/emacs"
