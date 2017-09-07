#!/bin/bash
#
#**********************************************************************************************
# Title: setup.sh
# Description: installs python packages via homebrew and pip
# Author: Sebastian Sonntag
# Date:
# License:
#**********************************************************************************************

# download and install pip
version=$1
action=$2
project=$3

if [ "$action" == "install" ]
then
    if [ "$version" == "py2" ]
    then
        sudo easy_install pip
        pip install virtualenv
    elif [ "$version" == "py3" ]
    then
        brew install python3
        brew install pip3
        pip3 install virtualenv
    fi
elif [ "$action" == "envcreate" ]
then
    if [ "$version" == "py2" ]
        then
        virtualenv $project
        source $project/bin/activate
        pip install scipy numpy matplotlib ipython pytest --ignore-installed six
    elif [ "$version" == "py3" ]
    then
        virtualenv --python=python3 $project
        source $project/bin/activate
        pip3 install scipy numpy matplotlib ipython pytest --ignore-installed six
    fi
fi
