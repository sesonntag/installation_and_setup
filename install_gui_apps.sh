#!/bin/bash

# update brew and run doctor to check whether issues occur
brew update
brew upgrade
brew doctor

# install cask to get acces to gui applications
brew tap caskroom/cask

# {Mircosoft Office 2016}
# no installation candidate -> install manually

# {MacTex}
brew cask install texpad
brew cask install mactex

# {Programmieren}
brew cask install macvim
brew cask install bbedit
brew cask install sourcetree
#brew cask install pycharm-ce
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

# run brew doctor once againg to find issues after package install
brew doctor
