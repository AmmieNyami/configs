#!/bin/sh

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

run dunst
run pipewire-pulse 1>&2 > /dev/null
run udiskie -t
run dex -a
