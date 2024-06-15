#!/bin/bash

function __f {
    if [[ $# != 1 ]] ; then
        echo "usage: $0 <perl-regexp>"
    else
        cmd="grep -RP \"$1\" ~/.emacs.d.*/{*init.el,*.org}"
        echo $cmd
        eval $cmd
    fi
}

__f $@
