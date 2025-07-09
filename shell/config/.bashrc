#!/bin/bash

# Customize the PS1
PS1='\u@\h:\w$ '

# Source .commonrc
[[ -f ~/.commonrc ]] && . ~/.commonrc
