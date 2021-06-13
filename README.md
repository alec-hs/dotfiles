# My dotfiles and OS setup

## Intro

My repo to setup OS and dotfiles on Linux, MacOS etc

## Requirements

- git
- curl

## Install

1. Make sure git and curl are installed

    ```bash
    apt update -y && apt install git curl -y
    ```

2. Clone repo

    ```bash
    git clone https://github.com/alec-hs/dotfiles ~/dotfiles
    ```

3. Make relevant setup file executable

    ```bash
    chmod +x ~/dotfiles/setup/debian.sh
    ```

4. Run setup file

    ```bash
    ~/dotfiles/setup/debian.sh
    ```
