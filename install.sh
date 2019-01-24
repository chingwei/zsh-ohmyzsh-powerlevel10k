#!/bin/sh

cd ~/.oh-my-zsh

[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak

ln -s ~/.oh-my-zsh/.zshrc ~/.zshrc

git submodule update --init

echo "Please Run [ source ~/.zshrc ] to Enable."

