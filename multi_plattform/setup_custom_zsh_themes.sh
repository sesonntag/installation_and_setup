#!/bin/zsh
#
#**********************************************************************************************
# Title: setup_custom_zsh_themes.sh
# Description:
# Author: Sebastian Sonntag
# Date: 2018-12-17
# License:
#**********************************************************************************************

# create folder for custom themes
mkdir $ZSH_CUSTOM/themes

# download hyperzsh theme
wget -O $ZSH_CUSTOM/themes/hyperzsh.zsh-theme https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme