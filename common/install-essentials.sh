#!/bin/bash
set -x
set -e

## install git
sudo add-apt-repository ppa:git-core/ppa -y \
    && sudo apt-get update \
    && sudo apt-get install git -y \
    && sudo rm -rf /var/lib/apt/lists/*

## personal configuration
git clone https://github.com/404pilot/.dotfiles.git

echo "source ~/.bash_aliases" >> ~/.bashrc \
    && ln -s ~/.dotfiles/bash/bash_aliases ~/.bash_aliases \
    && source ~/.bashrc

rm ~/.gitconfig | ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig

## chnage home directory
# sudo usermod -d ~/share vagrant
