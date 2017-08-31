#!/bin/bash

brew uninstall macvim
brew unlink vim
brew unlink macvim

rm -f $HOME/.vimrc
rm -rf $HOME/.vim

brew install macvim --with-override-system-vim
brew link macvim
git submodule update --init --recursive

ln -s $PWD/.vim $HOME/.vim
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/vim-pathogen/autoload/ $HOME/.vim/autoload

brew install ctags
sudo pip install jedi
