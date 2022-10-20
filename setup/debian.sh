#!/bin/bash

# Update and install basic packages
sudo apt update -y && sudo apt upgrade -y
sudo apt install wget net-tools python3 unzip gpg -y

# Oh My Posh install
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

# Oh My Posh themes
mkdir ~/.poshthemes
mkdir ~/.cache
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

# Add Oh My Posh to .bashrc
echo 'eval "$(oh-my-posh init bash --config ~/.dotfiles/oh-my-posh/alec-hs.omp.json)"' >> ~/.bashrc

# Link git config file
ln -s ~/.dotfiles/git/linux/.gitconfig ~/.gitconfig

# Get name and email from .gitconfig
name=$(grep name ~/.gitconfig | awk '{print $3}')
email=$(grep email ~/.gitconfig | awk '{print $3}')

cat > ~/.gpg.conf <<EOF
Key-Type: eddsa  
Key-Curve: ed25519
Key-Usage: sign
Subkey-Type: ecdh
Subkey-Curve: cv25519
Subkey-Usage: encrypt
Name-Real: $name
Name-Email: $email
Expire-Date: 0
%commit
EOF

# Generate gpg key
gpg --batch --gen-key ~/.gpg.conf
rm ~/.gpg.conf

# Get gpg key id
keyid=$(gpg --list-secret-keys --keyid-format LONG | grep sec | awk '{print $2}' | cut -d '/' -f 2)

# Export public key
gpg --armor --export $keyid > ~/.gnupg/$keyid.txt
pub=$(gpg --armor --export $keyid)

# Set key as default in git
git config --global user.signingkey $keyid

# Display public key
cat << EOM

######                        START INFO                        ######
This is your public key.

It is also saved in the following location:

~/.gnupg/$keyid.txt

$pub

When you are done run 'exec bash' to reload your bashrc.

######                         END INFO                         ######

EOM

