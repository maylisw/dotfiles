#!/bin/bash

source install-colors.sh
# source install-fonts.sh todo: uncomment when script works

tmux_dir="tmux/plugins/tpm"
if [ ! -d "${tmux_dir}" ]; then
    git clone https://github.com/tmux-plugins/tpm "${tmux_dir}"
fi

brew bundle -q

cd ~/.dotfiles || exit
RCRC=./rcrc rcup
