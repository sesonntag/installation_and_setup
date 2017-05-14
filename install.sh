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

