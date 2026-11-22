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

# Put linuxbrew on PATH at the top of zshrc (idempotent)
brew_eval='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
zshrc="$(readlink -f ~/.zshrc)"
if ! grep -qxF "${brew_eval}" "${zshrc}"; then
    printf '%s\n%s\n' "${brew_eval}" "$(cat "${zshrc}")" > "${zshrc}"
fi
