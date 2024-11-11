#!/bin/bash
set -euo pipefail

source tmux-colors.sh

tmux_dir="tmux/plugins/tpm"
if [ ! -d "${tmux_dir}" ]; then
    git clone https://github.com/tmux-plugins/tpm "${tmux_dir}"
fi

brew bundle -q

cd ~/.dotfiles
RCRC=./rcrc rcup -B qa-mydev
