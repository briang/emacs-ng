#!/bin/bash

EMACS="/opt/emacs/bin/emacs"
# EMACS="/usr/bin/emacs"
EMACS_FLAGS="--init-directory $(pwd)"

hyperfine \
    "${EMACS} ${EMACS_FLAGS} --eval '(save-buffers-kill-emacs)'"
