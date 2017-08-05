#!/bin/bash
#
#**********************************************************************************************
# Title: python2_install.sh
# Description: installs python packages via pip
# Author: Sebastian Sonntag
# Date: 2017-08-05
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

# install virtualenv for administration of multiple environments
pip install virtualenv

# install pytest as default testing framework
pip install pytest
