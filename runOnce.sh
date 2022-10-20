#!/bin/bash

# Clone repo
git clone https://github.com/alec-hs/dotfiles ~/.dotfiles

# Make setup executable
chmod +x ~/.dotfiles/setup/debian.sh

# Run setup
~/.dotfiles/setup/debian.sh
