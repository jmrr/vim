#!/bin/bash

UNAME=$(uname)

if [ $UNAME = "Darwin"  ]
then

	brew uninstall macvim
	brew install macvim --with-override-system-vim
	brew unlink vim
	brew unlink macvim
       	brew link macvim

	ln -sf $PWD/.vim ~/.vim
	ln -sf $PWD/.vimrc ~/.vimrc

elif [ $UNAME = "Linux"  ]
then

	sudo apt purge vim
	sudo apt install vim

	ln -sf $(realpath .vim) ~/.vim
	ln -sf $(realpath .vimrc) ~/.vimrc

fi

git submodule update --init --recursive
