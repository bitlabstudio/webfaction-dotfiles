# Webfaction dotfiles

This repository shall contain settings for .bashrc, .gitconfig and .vimrc that
would be useful to have on all our Webfaction servers.

# Prerequisites

* Mercurial (easy_install mercurial)

# Usage

``ssh`` into your Webfaction server, then clone this repository:

    cd ~
    git clone git://github.com/bitmazk/webfaction-dotfiles.git

Install vim with Python support:

    # make sure to install Mercurial first
    cd ~
    ./webfaction-dotfiles/bin/install_vim.sh

Add line to ``.bashrc``:

    export PATH=$HOME/bin:$PATH

Create symlinks:

    cd ~
    ln -s webfaction-dotfiles/.gitconfig
    ln -s webfaction-dotfiles/.gitignore_global
    ln -s webfaction-dotfiles/.screenrc
    ln -s webfaction-dotfiles/.vimrc
    rm -rf .vim
    ln -s webfaction-dotfiles/.vim

Profit!

# TODO

* Create setup script that installs all prerequisites
