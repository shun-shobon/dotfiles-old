#!/usr/bin/env bash

run "[ -d \"${TMUX_DATA_DIR}/plugins/tpm\" ] || git clone https://github.com/tmux-plugins/tpm \"${TMUX_DATA_DIR}/plugins/tpm\""

run "${TMUX_DATA_DIR}/plugins/tpm/tpm"
