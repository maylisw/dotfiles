#!/bin/bash

source tmux-colors.sh

tmux_dir="tmux/plugins/tpm"
if [ ! -d "${tmux_dir}" ]; then
    git clone https://github.com/tmux-plugins/tpm "${tmux_dir}"
fi

brew bundle -q
rcup -x Brewfile -x install.sh -x Brewfile.lock.json -x install.sh -x itermcolors
