#!/bin/bash
#
#**********************************************************************************************
# Title: install.sh
# Description: installs home brew and and packages accordingly
# Author: Sebastian Sonntag
# Date: 2017-05-14
# License:
#**********************************************************************************************

# download and install home brew at first
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# run brew doctor to check whether issues occur
brew doctor

# update brew
brew update

# upgrade brew
brew upgrade

# install macvim
brew install macvim
brew linkapps macvim

# install tmux
brew install tmux

# install htop
brew install htop

# install speedtest via cli
brew install speedtest_cli

# install tree
brew install tree

# install zsh and oh-my-zsh
brew install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# run brew doctor once again after installation
brew doctor
