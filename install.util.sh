# This file is not meant to be run directly. Instead,
# it should be sourced by a main script.

link_path() {
    if [ -z "$1" ]; then
        echo "ERROR: argument 1 of function \`link_path\` not provided" >&2
        exit 1
    fi

    if [ -z "$2" ]; then
        echo "ERROR: argument 2 of function \`link_path\` not provided" >&2
        exit 1
    fi

    if [ -e "$2" ]; then
        printf "\`$2\` already exists. Replace it? (y/n) "
        read answer
        if [ "$answer" = "y" ]; then
            rm -r $2
        else
            echo "WARNING: user chose not to replace existing path" >&2
            return
        fi
    fi

    ln -s "$1" "$2"
}

install_config() {
    if [ -z "$1" ]; then
        echo "ERROR: argument 1 of function \`install_config\` not provided" >&2
        exit 1
    fi

    pushd "$1" > /dev/null 2>&1

    if [ ! -f "./install.sh" ]; then
        echo "ERROR: \`install.sh\` script not found in directory \`$(pwd)\`" >&2
        exit 1
    fi

    . ./install.sh
    popd > /dev/null 2>&1
}

find_command() {
    if [ -z "$1" ]; then
        echo "ERROR: argument 1 of function \`find_command\` not provided" >&2
        exit 1
    fi

    if ! command -v "$1" 2>&1 >/dev/null; then
        echo "ERROR: command \`$1\` could not be found" >&2
        exit 1
    fi
}
