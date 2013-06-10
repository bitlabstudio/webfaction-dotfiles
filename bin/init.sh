#!/bin/sh

# First lets install zsh and change the default shell
# =============================================================================
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /bin/zsh


# Now we place some symlinks with useful aliases and settings
# =============================================================================
cd $HOME
rm $HOME/.zshrc
cp webfaction-dotfiles/.bashrc .
cp webfaction-dotfiles/.gitconfig .
ln -s webfaction-dotfiles/.zshrc
ln -s webfaction-dotfiles/.bash_aliases
ln -s webfaction-dotfiles/.gitignore_global
ln -s webfaction-dotfiles/.screenrc
ln -s webfaction-dotfiles/.vim
ln -s webfaction-dotfiles/.vimrc

mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/webfaction-dotfiles/bin/search.sh
ln -s $HOME/webfaction-dotfiles/bin/show-memory.sh

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


# Install virtualenv and virtualenvwrapper
# =============================================================================
mkdir -p $HOME/lib/python2.7
easy_install-2.7 virtualenv
easy_install-2.7 pip
pip-2.7 install virtualenvwrapper==3.5

echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7' >> $HOME/.bash_exports
echo 'export WORKON_HOME=$HOME/Envs' >> $HOME/.bash_exports
echo 'export PIP_VIRTUALENV_BASE=$WORKON_HOME' >> $HOME/.bash_exports
echo 'export PIP_RESPECT_VIRTUALENV=true' >> $HOME/.bash_exports
echo 'export VIRTUALENVWRAPPER_TMPDIR="$WORKON_HOME/tmp"' >> $HOME/.bash_exports
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7" >> $HOME/.bash_exports
echo 'source $HOME/bin/virtualenvwrapper.sh' >> $HOME/.bash_exports


# Install supervisor
# =============================================================================
pip-2.7 install supervisor

echo "All done!"
echo "Don't forget to personalise your .gitconfig:"
echo 'git config --global user.email "<yourmail@gmail.com>"'
echo 'git config --global user.name "Your Name"'
