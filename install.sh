#!/bin/sh

source install-colors.sh
# source install-fonts.sh todo: uncomment when script works

rcup -x Brewfile -x install.sh -x Brewfile.lock.json -x install.sh -x itermcolors
brew bundle -q
