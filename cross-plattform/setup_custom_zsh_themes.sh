#!/bin/zsh
#
#**********************************************************************************************
# Title: setup_custom_zsh_themes.sh
# Description:
# Author: Sebastian Sonntag
# Date: 2019-12-29
# License:
#**********************************************************************************************

# create folder for custom themes
mkdir $ZSH_CUSTOM/themes

# download hyperzsh theme
wget -O $ZSH_CUSTOM/themes/hyperzsh.zsh-theme https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme

# download powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k