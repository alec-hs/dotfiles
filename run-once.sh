#!/bin/bash

# Update and install dependencies
sudo apt update -y && sudo apt updgrade -y && sudo apt install git curl -y

# Clone repo
git clone https://github.com/alec-hs/dotfiles ~/.dotfiles

# Make setup executable
chmod +x ~/.dotfiles/setup/debian.sh

# Run setup
~/.dotfiles/setup/debian.sh
