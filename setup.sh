#!/bin/bash

echo "Start Start Start !!!\n"
echo "Install app"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags xclip git astyle #python-setuptools python-dev
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags xclip  astyle #python-setuptools python-devel	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

mv -f ~/.vim/  ~/.vim_old_lcd/
mv -f ~/.vimrc ~/.vimrc_old_lcd

cd ~/ && git clone https://github.com/lcdsdream/vim.git

mv -f ~/vim ~/.vim
mv -f ~/.vim/.vimrc ~/

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "lcddcl start install bundle" > lcdinstall
echo "please wati" >> lcdinstall

vim lcdinstall -c "BundleInstall" -c "q" -c "q"
rm lcdinstall
echo "lcd's vim install finished"
