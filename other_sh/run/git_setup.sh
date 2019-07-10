#!/bin/bash

sudo apt-get install git gitk meld

touch ~/.gitignore
echo "cscope*" > ~/.gitignore
echo "tag*" >> ~/.gitignore
echo "*.swp" >> ~/.gitignore
echo "*.o" >> ~/.gitignore
echo ".vscode" >> ~/.gitignore
echo ".root" >> ~/.gitignore

git config --global core.excludesfile ~/.gitignore
git config --global user.name orientlu
git config --global user.email lcdsdream@126.com
git config --global core.editor "vim"

git config --list

