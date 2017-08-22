#!/bin/bash
#
#**********************************************************************************************
# Title: install.sh
# Description: installs home brew and and packages accordingly
# Author: Sebastian Sonntag
# Date: 2017-08-18
# License:
#**********************************************************************************************

# download and install home brew at first
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cd

# run brew doctor to check whether issues occur
brew doctor

# update and upgrade brew
brew update
brew upgrade

# install cask to get acces to gui applications
brew tap caskroom/cask



# install cli application first
# install tmux and tool to enable access to system clipboard
brew install tmux
brew install reattach-to-user-namespace

# install htop
brew install htop

# install speedtest via cli
brew install speedtest_cli

# install tree
brew install tree

# install bash-snippets for stock, weather, calc, ... info
brew install bash-snippets

# install cli search engine googler
brew install googler

# install the silver searcher
brew install the_silver_searcher

# install zsh and oh-my-zsh
brew install zsh zsh-completions
cd && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install vundle for vim and create vim dirs
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/swp
mkdir ~/.vim/backup
mkdir ~/.vim/undo



# install gui application in order of appearence in menu

# {Mircosoft Office 2016}
# no installation candidate -> install manually

# {MacTex}
brew cask install texpad
brew cask install mactex

# {Programmieren}
brew cask install macvim
brew cask install bbedit
brew cask install sourcetree
brew cask install pycharm-ce
# Matlab -> install manually

# {Soziale Netzwerke}
brew cask install whatsappdesktop
# twitter -> install via AppStore
brew cask install skype
brew cask install teamviewer

# {Medien}
brew cask install vlc
brew cask install clipgrab

# {Verschiedenes}
brew cask install caffeine
# jetdrive toolbox -> install manually
brew cask install dropbox
# cisco anyconnect -> install manuelly
brew cask install android-file-transfer
# duplicate cleaner -> install via AppStore
# debit -> install via AppStore



# run brew doctor to find issues after package install
brew doctor
