#!/bin/sh

rm -f ~/.vimrc
rm -rf ~/.vim

mv -f ~/.vimrc_old_lcd ~/.vimrc
mv -f ~/.vim_old_lcd   ~/.vim
