#!/bin/sh

rcup -x Brewfile -x install.sh -x Brewfile.lock.json -x install.sh -v
brew bundle
