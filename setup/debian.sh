#!/bin/bash

# Update and install basic packages
sudo apt update -y && sudo apt upgrade -y
sudo apt install zsh zplug net-tools -y

# Install oh-my-zsh & plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/themes/powerlevel10k
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
sudo git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/k

# Delete exsting dotfiles
rm ~/.zshrc
rm ~/.p10k.zsh

# Create Symlinks
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh