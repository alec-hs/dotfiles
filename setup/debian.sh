#!/bin/bash

# Update and install basic packages
apt update -y && apt upgrade -y
apt install zsh zplug net-tools -y

# Install oh-my-zsh & plugins
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/k

# Delete exsting dotfiles
rm ~/.zshrc
rm ~/.p10k.zsh

# Create Symlinks
ln -sv ~/dotfiles/zsh/.zshrc ~
ln -sv ~/dotfiles/zsh/.p10k.zsh ~