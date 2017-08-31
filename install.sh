#!/bin/bash

UNAME=$(uname)

if [ $UNAME = "Darwin"  ]
then

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

elif [ $UNAME = "Linux"  ]
then

	sudo apt purge vim
	sudo apt install vim

	ln -sf $(realpath .vim) ~/.vim
	ln -sf $(realpath .vimrc) ~/.vimrc

fi

sudo pip install jedi
git submodule update --init --recursive
