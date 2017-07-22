#!/bin/bash

brew install macvim --with-override-system-vim
brew linkapps

git submodule init
git submodule update

ln -s ./.vimrc ~/.vimrc
ln -s ./vim ~/.vim
