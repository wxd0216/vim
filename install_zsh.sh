#!/bin/bash
# by orientlu

sudo apt-get install curl

## install zsh
sudo apt-get install zsh
chsh -s /bin/zsh
## https://www.cnblogs.com/EasonJim/p/7863099.html

## install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## plugins=(zsh-autosuggestions)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
## -> 选中

## plugins=(zsh-syntax-highlighting)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## autojump
sudo apt-get install autojump

cp ~/.zshrc ~/.zshrc_back
cp ./zshrc ~/.zshrc
