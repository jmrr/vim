#!/bin/bash

brew uninstall macvim
brew unlink vim
brew unlink macvim
brew install macvim --with-override-system-vim

rm -f $HOME/.vimrc
rm -rf $HOME/.vim

brew link macvim
brew install ctags

ln -s $PWD/.vim $HOME/.vim
ln -s $PWD/.vimrc $HOME/.vimrc

sudo pip install jedi
git submodule update --init --recursive
