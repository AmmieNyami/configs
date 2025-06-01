#!/bin/bash

# Customize the PS1
PS1='\u@\h:\w$ '

# Source .posixshellrc-personal
[[ -f ~/.posixshellrc-personal ]] && . ~/.posixshellrc-personal
