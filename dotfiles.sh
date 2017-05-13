#!/bin/bash
#
#**********************************************************************************************
# Title: dotfiles.sh
# Description: Symlink dotfiles into home dir
# Author: Sebastian Sonntag
# Date: 2017-05-13
# License:
#**********************************************************************************************

# definition of path variables used
dotfilesPath="~/iCloud/System/Multiplattform/Dotfiles"

# bash_profile
ln -s $dotfilesPath/bash_profile ~/.bash_profile

# emacs config
#ln -s $dotfilesPath/emacs ~/.emacs

# gitconfig file
ln -s $dotfilesPath/gitconfig ~/.gitconfig

# global gitigonore file
ln -s $dotfilesPath/gitignore_global ~/.gitignore_global

# tmux configuration file
ln -s $dotfilesPath/tmux.conf ~/.tmux.conf

# vim configuration file
ln -s $dotfilesPath/vimrc ~/.vimrc

# z-shell configuration file
#ln -s $dotfilesPath/zshrc ~/.zshrc
