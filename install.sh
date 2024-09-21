#!/bin/sh

brew bundle
rcup -x Brewfile -x install.sh -x Brewfile.lock.json -x install.sh -v
