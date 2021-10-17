# My dotfiles and OS setup

## Intro

My repo to setup OS and dotfiles on Linux, MacOS & Windows

## Requirements

- git (all)
- curl (linux & macos)
- [nerd font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraMono) (all)
- powershell (windows)

## Install (Linux)

1. Make sure git and curl are installed

    ```bash
    sudo apt update -y && sudo apt install git curl -y
    ```

2. Run initiation script

    ```bash
    bash <(curl -fsSL https://raw.githubusercontent.com/alec-hs/dotfiles/main/runOnce.sh)
    ```

## Install (Windows)

1. Make sure git and powershell are installed
2. Open Powershell as Admin
3. Execute

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
    ```

4. Run initiation script

    ```powershell
    iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/alec-hs/dotfiles/main/runOnce.ps1'))
    ```
