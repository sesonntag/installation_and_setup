#!/bin/bash
#
#*******************************************************************************
# Title: install_cli_apps.sh
# Description: Shell script to install and setup all cli apps on a new macOS 
#              device
# Author: Sebastian Sonntag
# Date: 2018-03-25
# License:
#*******************************************************************************

# download and install home brew at first
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cd

# run brew doctor to check whether issues occur
brew doctor

# update and upgrade brew
brew update
brew upgrade

# install cli application first
# install tmux and tool to enable access to system clipboard
brew install tmux
brew install reattach-to-user-namespace

# install htop
brew install htop

# install tree
brew install tree

# install bash-snippets for stock, weather, , ... info
brew install bash-snippets

# install git repo issue checker
brew install git-sizer

# install zsh and oh-my-zsh
brew install zsh zsh-completions
cd && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install cli calculator
brew install calc

# install vundle for vim and create vim dirs
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/swp
mkdir ~/.vim/backup
mkdir ~/.vim/undo
