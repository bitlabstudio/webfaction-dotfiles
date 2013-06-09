#!/bin/sh

# First lets install zsh and change the default shell
# =============================================================================
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /bin/zsh


# Now we place some symlinks with useful aliases and settings
# =============================================================================
cd $HOME
rm $HOME/.zshrc
ln -s webfaction-dotfiles/.zshrc
ln -s webfaction-dotfiles/.bash_aliases
ln -s webfaction-dotfiles/.gitconfig
ln -s webfaction-dotfiles/.gitignore_global
ln -s webfaction-dotfiles/.screenrc
ln -s webfaction-dotfiles/.vim
ln -s webfaction-dotfiles/.vimrc

mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/webfaction-dotfiles/search.sh
ln -s $HOME/webfaction-dotfiles/show-memory.sh

cd $HOME
echo 'export PATH=$HOME/bin:$PATH' >> $HOME/.bash_exports


# Install Vim with Python support
# =============================================================================
cd $HOME
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
