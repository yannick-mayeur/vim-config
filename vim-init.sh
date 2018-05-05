#!/bin/bash

pacman -S gvim git
cd ~
git clone http://github.com/yannick-mayeur/vim-config.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update

