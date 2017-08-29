#!/bin/bash

UNAME=$(uname)

if [ $UNAME = "Darwin"  ]
then

	brew uninstall macvim
	brew install macvim --with-override-system-vim
	brew unlink vim
	brew unlink macvim
       	brew link macvim

	rm -f $PWD/.vimrc
	rm -rf $PWD/.vim
	ln -s $PWD/.vim ~/.vim
	ln -s $PWD/.vimrc ~/.vimrc

elif [ $UNAME = "Linux"  ]
then

	sudo apt purge vim
	sudo apt install vim

	ln -sf $(realpath .vim) ~/.vim
	ln -sf $(realpath .vimrc) ~/.vimrc

fi

sudo pip install jedi
git submodule update --init --recursive
