#!/bin/bash
#
#**********************************************************************************************
# Title: install.sh
# Description: installs python packages via pip
# Author: Sebastian Sonntag
# Date: 2017-07-07
# License:
#**********************************************************************************************

# download and install pip
sudo easy_install pip

# install ipython shell for advanced testing
pip install ipython

# install numerical libraries
pip install numpy

# install scientific libraries
pip install scipy

# install libraries for plotting
pip install matplotlib
