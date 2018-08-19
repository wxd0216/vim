#!/bin/bash

echo "Start Start Start !!!\n"
echo "Install app"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gtk ctags cscope xclip git astyle tmux cmake g++
    sudo apt-get install -y python python3 cmake python-dev python3-dev
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags cscope xclip  astyle tmux
fi
rm ~/.vim_old_lcd/ -rf
rm ~/.vimrc_old_lcd -f

mv -f ~/.vim/  ~/vim_old_lcd/
mv -f ~/.vimrc ~/vimrc_old_lcd

cd ~/ && git clone https://github.com/lcdsdream/vim.git

mv -f ~/vim ~/.vim
cp ~/.vim/.vimrc ~/

# other setup
cp ~/.vim/other_sh/config/tmux.conf ~/.tmux.conf
sudo cp ~/.vim/other_sh/cp2bin/*  /usr/bin/
cd ~/.vim/other_sh/run/
sudo ./run.sh
cd -

echo "lcddcl start install bundle" > lcdinstall
echo "please wati" >> lcdinstall

vim lcdinstall -c "PlugInstall" -c "PlugClean" -c "q" -c "q"
rm lcdinstall
echo "lcd's vim install finished"
