#!/bin/sh

source install-colors.sh
# source install-fonts.sh todo: uncomment when script works

tmux_dir="tmux/plugins/tpm"
if [ ! -d "${tmux_dir}" ]; then
    git clone https://github.com/tmux-plugins/tpm "${tmux_dir}"
fi

rcup -x Brewfile -x install.sh -x Brewfile.lock.json -x install.sh -x itermcolors
brew bundle -q
