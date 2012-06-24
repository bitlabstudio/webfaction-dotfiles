#!/bin/sh
# Installs Vim with Python support
ln -s webfaction-dotfiles/.bash_aliases
ln -s webfaction-dotfiles/.gitconfig
ln -s webfaction-dotfiles/.gitignore_global
ln -s webfaction-dotfiles/.screenrc
ln -s webfaction-dotfiles/.vim
ln -s webfaction-dotfiles/.vimrc
mkdir .ssh && cd .ssh
ln -s ../webfaction-dotfiles/.ssh/config
touch authorized_keys && chmod 600 authorized_keys
cd ~ && chmod 700 .ssh && chmod go-w $HOME
mkdir -p lib/python2.7
easy_install-2.7 mercurial
mkdir -p ~/src
mkdir -p ~/opt
mkdir -p ~/bin
hg clone https://vim.googlecode.com/hg/ ~/src/vim
cd ~/src/vim
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
cd ~/bin
ln -s ~/opt/vim/bin/vim
