#!/bin/bash

echo "Start Start Start !!!\n"
echo "Install app"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gtk ctags cscope xclip git astyle tmux #python-setuptools python-dev
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags cscope xclip  astyle tmux #python-setuptools python-devel
fi
##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags cscope git astyle tmux
fi

sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

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

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "lcddcl start install bundle" > lcdinstall
echo "please wati" >> lcdinstall

vim lcdinstall -c "BundleInstall" -c "BundleClean" -c "q" -c "q"
rm lcdinstall
echo "lcd's vim install finished"
