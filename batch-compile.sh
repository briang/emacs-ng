#!/bin/bash

function __fn {
    if [ -z "$1" ] ; then
	echo > /dev/stderr "usage: $0 file.el ..."
	exit 1
    else
	while [[ "$1" != "" ]] ; do
	    echo Compiling file "$1"
	    emacs --batch -Q -f batch-byte-compile "$1"
	    shift
	done
    fi
}

__fn "$@"

unset __fn
