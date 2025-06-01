# This file is not meant to be run directly. Instead,
# it should be sourced by the root `install.sh` script.

echo "Installing shell config..."

ZSHAS_PATH="${HOME}/.zshas"
ZSHSH_PATH="${HOME}/.zshsh"

# Ensure git is installed
find_command git

# Ensure zsh-autosuggestions is at the expected path
if [ ! -d "$ZSHAS_PATH" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone \
        --depth 1 \
        --branch v0.7.0 \
        https://github.com/zsh-users/zsh-autosuggestions \
        $ZSHAS_PATH > /dev/null 2>&1
    if [ "$?" != 0 ]; then
        echo "ERROR: failed to install zsh-autosuggestions" >&2
        exit 1
    fi
fi

# Ensure zsh-syntax-highlighting is at the expected path
if [ ! -d "$ZSHSH_PATH" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone \
        --depth 1 \
        --branch 0.8.0 \
        https://github.com/zsh-users/zsh-syntax-highlighting \
        $ZSHSH_PATH > /dev/null 2>&1
    if [ "$?" != 0 ]; then
        echo "ERROR: failed to install zsh-syntax-highlighting" >&2
        exit 1
    fi
fi

# Ensure needed commands for the shell aliases are
# installed.
find_command eza
find_command nvim

# Install shell config
link_path "$(pwd)/config/.zshrc" "${HOME}/.zshrc"
link_path "$(pwd)/config/.bashrc" "${HOME}/.bashrc"
link_path "$(pwd)/config/.posixshellrc-personal" "${HOME}/.posixshellrc-personal"
link_path "$(pwd)/config/.posixshellrc-path" "${HOME}/.posixshellrc-path"
