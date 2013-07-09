# Webfaction dotfiles

This repository shall contain settings for .bashrc, .gitconfig and .vimrc that
would be useful to have on all our Webfaction servers.

# Usage

``ssh`` into your Webfaction server, then clone this repository:

    cd ~
    git clone https://github.com/bitmazk/webfaction-dotfiles.git
    ./webfaction-dotfiles/bin/init.sh

The script will ask you to enter your password in order to change the shell
to zsh, after that it will take a few minutes to install mercurial and vim.

When it's done it will remind you of the following::

    Don't forget to personalise your .gitconfig:
    git config --global user.email "<yourmail@gmail.com>"
    git config --global user.name "Your Name"

This is necessary in case you want to create your Django project right on the
server. In order to make the initial commit, you need to provide your git
user name and email.

Further preparation and usage of this script is described in my PyCon SG 2013
tutorial. The slides can be found here: https://speakerdeck.com/mbrochh/hosting-complex-web-applications-on-webfaction-servers

If you would like to kickstart your Django project right on the server after
installing the webfaction dotfiles, please check out https://github.com/bitmazk/django-project-template
