#!/bin/zsh

# Source .posixshellrc-personal
[[ -f ~/.posixshellrc-personal ]] && . ~/.posixshellrc-personal

# Customize PROMPT
PROMPT="%n@%m:%~$ "

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Make autocomplete prettier
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Shortcuts
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word

# Enable zsh syntax highlighting
source ~/.zshsh/zsh-syntax-highlighting.zsh

# Enable zsh auto suggestions
source ~/.zshas/zsh-autosuggestions.zsh
