# Webfaction dotfiles

This repository shall contain settings for .bashrc, .gitconfig and .vimrc that
would be useful to have on all our Webfaction servers.

# Prerequisites

* Mercurial

# Usage

``ssh`` into your Webfaction server, then clone this repository:

    ::sh
    cd ~
    git clone git://github.com/bitmazk/webfaction-dotfiles.git

Install vim with Python support:

    ::sh
    cd ~
    ./webfaction-dotfiles/bin/install_vim.sh

Add line to ``.bashrc``:

    ::sh
    export PATH=$HOME/bin:$PATH

Create symlinks:

    ::sh
    cd ~
    ln -s webfaction-dotfiles/.gitconfig
    ln -s webfaction-dotfiles/.gitignore_global
    ln -s webfaction-dotfiles/.vimrc
    rm -rf .vim
    ln -s webfaction-dotfiles/.vim

Profit!

# TODO

* Create setup script that installs all prerequisites
