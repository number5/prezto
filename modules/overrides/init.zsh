#!/usr/bin/env zsh

setopt EXTENDED_GLOB NULL_GLOB

sourcedir() {
    if [ ! -d "$1" ]; then
        echo "directory $1 not exists!"
        return 1
    fi
    for f in "$1"/[0-9][0-9]-*; do
        case $f in 
            *~|*.bak|*.old|*.sw?|*.zwc|*.disabled) continue;;
        esac
        source "$f"
    done
}

sourcedir ${0:a:h}/parts.d

unsetopt NULL_GLOB
# vim:ft=zsh
