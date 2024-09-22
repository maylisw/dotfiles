#!/bin/sh

source install-colors.sh

rcup -x Brewfile -x install.sh -x Brewfile.lock.json -x install.sh -x itermcolors -v
brew bundle
