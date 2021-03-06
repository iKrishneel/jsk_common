#!/usr/bin/env bash
# -*- mode: Shell-script; -*-

# source 99.jsk_tools.sh from same directory as this file
_THIS_DIR=$(builtin cd "`dirname "${BASH_SOURCE[0]}"`" > /dev/null && pwd)
. "$_THIS_DIR/99.jsk_tools.sh"


# PR at upstream: https://github.com/ros/ros/pull/99
function rosview {
    local arg
    if [[ $1 = "--help" ]]; then
       echo -e "usage: rosview [package] [file]\n\nView a file within a package with pager."
       return 0
    fi
    _roscmd ${1} ${2}
    if [[ -n ${arg} ]]; then
        if [[ -z $PAGER ]]; then
            less ${arg}
        else
            $PAGER ${arg}
        fi
    fi
}
complete -F "_roscomplete_file" "rosview"
