#!/bin/bash

set -e

. "./install.util.sh"

install_common_configs() {
    install_config "./emacs"
    install_config "./shell"
    install_config "./alacritty"
}

install_desktop_configs() {
    install_config "./niri"
    install_config "./fuzzel"
    install_config "./dunst"
    install_config "./waybar"
}

if [ -z "$1" ]; then
    echo "ERROR: no subcommand was provided" 1>&2
    echo "USAGE: install.sh <common | desktop>" 1>&2
    exit 1
fi

case "$1" in
    common)
        echo "Installing configs..."
        install_common_configs
        ;;

    desktop)
        echo "Installing configs..."
        install_common_configs
        install_desktop_configs
        ;;

    *)
    echo 'ERROR: unknown subcommand: `'"$1"'`' 1>&2
    echo "USAGE: install.sh <common | desktop>" 1>&2
    ;;
esac
