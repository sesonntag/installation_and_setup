#!/bin/sh
#
#*******************************************************************************
# Title: install_new_mac.sh
# Description: setup a new (or fresh macos installed) mac
# Author: Sebastian Sonntag
# Date: 2019-02-23
# License:
#*******************************************************************************

# install homebrew  for macos and update its data base
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# install homebrew non gui apps
list_of_non_gui_apps="calc colordiff ctags git git-sizer htop neovim python pipenv reattach-to-user-namespace rename the_silver_searcher tig tmux tree wget youtube-dl zsh zsh-completions"
brew install $list_of_non_gui_apps

# install homebrew gui apps
list_of_gui_apps="clipy dropbox keka mactex skype sourcetree teamviewer texpad visual-studio-code vlc"
brew cask install $list_of_gui_apps

# install oh-my-zsh and prepare for linking my dotfiles
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc

# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# link my dotfiles
cd ~/
ln -s System/dotfiles/ctags .ctags
ln -s System/dotfiles/flake8 .flake8
ln -s System/dotfiles/gitconfig .gitconfig
ln -s System/dotfiles/gitignore_global .gitignore_global
ln -s System/dotfiles/tmux.conf .tmux.conf
ln -s System/dotfiles/vimrc .vimrc
ln -s System/dotfiles/zshrc .zshrc

# setup vim dir also for neovim
cd ~/.vim
ln -s ~/.vimrc nvim.init
cd ~/.config
ln -s ~/vim nvim
cd ~/
mkdir ~/.vim/swp
mkdir ~/.vim/backup
mkdir ~/.vim/undo

## create symlinks i typically use
# cd ~/
# ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud
# ln -s ~/iCloud/Aktuelles ~/Aktuelles
# ln -s ~/iCloud/Arbeit ~/Arbeit
# ln -s ~/iCloud/Auto ~/Auto
# ln -s ~/iCloud/Bilder/Wallpaper ~/Pictures/Wallpaper
# ln -s ~/iCloud/Bilder/Ich ~/Pictures/Ich
# ln -s ~/iCloud/Documents ~/Dokumente
# ln -s ~/iCloud/Programmieren ~/Programmieren
# ln -s ~/iCloud/Segeln ~/Segeln
# ln -s ~/iCloud/System ~/System
# ln -s ~/Desktop ~/Schreibtisch