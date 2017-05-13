#!/bin/bash
#
#**********************************************************************************************
# Title: dotfiles.sh
# Description: Symlink dotfiles into home dir
# Author: Sebastian Sonntag
# Date: 2017-05-13
# License:
#**********************************************************************************************

# bash_profile
ln -s ~/iCloud/System/Multiplattform/Dotfiles/bash_profile ~/.bash_profile

# emacs config
#ln -s ~/iCloud/System/Multiplattform/Dotfiles/emacs ~/.emacs

# gitconfig file
ln -s ~/iCloud/System/Multiplattform/Dotfiles/gitconfig ~/.gitconfig

# global gitigonore file
ln -s ~/iCloud/System/Multiplattform/Dotfiles/gitignore_global ~/.gitignore_global

# tmux configuration file
ln -s ~/iCloud/System/Multiplattform/Dotfiles/tmux.conf ~/.tmux.conf

# vim configuration file
ln -s ~/iCloud/System/Multiplattform/Dotfiles/vimrc ~/.vimrc

# z-shell configuration file
#ln -s ~/iCloud/System/Multiplattform/Dotfiles/zshrc ~/.zshrc
