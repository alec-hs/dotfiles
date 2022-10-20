#!/bin/bash

# Update and install basic packages
sudo apt update -y && sudo apt upgrade -y
sudo apt install wget net-tools python3 unzip -y

# Oh My Posh install
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

# Oh My Posh themes
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

# Add Oh My Posh to .bashrc
echo 'eval "$(oh-my-posh init bash --config ~/.dotfiles/oh-my-posh/alec-hs.omp.json)"' >> ~/.bashrc