#!/bin/bash


hyperfine \
    "emacs --init-directory $(pwd) --eval '(save-buffers-kill-emacs)'"
