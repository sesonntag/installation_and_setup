#!/bin/bash
#
#**********************************************************************************************
# Title: python3_install.sh
# Description: installs python3 packages via pip3
# Author: Sebastian Sonntag
# Date: 2017-08-05
# License:
#**********************************************************************************************

# install ipython shell for advanced testing
pip3 install ipython

# install numerical libraries
pip3 install numpy

# install scientific libraries
pip3 install scipy

# install libraries for plotting
pip3 install matplotlib

# install virtualenv for administration of multiple environments
pip3 install virtualenv

# install pytest as default testing framework
pip3 install pytest
