#!/bin/bash
#
#**********************************************************************************************
# Title: icloud.sh
# Description: Symlink iCloud into home dir
# Author: Sebastian Sonntag
# Date: 2017-06-10
# License:
#**********************************************************************************************

# iCloud path
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud

# path for temporarily content
ln -s ~/iCloud/Aktuelles ~/Aktuelles

# path for work realted documents (non company of course)
ln -s ~/iCloud/Arbeit ~/Arbeit

# path for car related files
ln -s ~/iCloud/Auto ~/Auto

# path to wallpapers
ln -s ~/iCloud/Bilder/Wallpaper ~/Pictures/Wallpaper

# path for pictures of me
ln -s ~/iCloud/Bilder/Ich ~/Pictures/Ich

# path for documents
ln -s ~/iCloud/Documents ~/Dokumente

# path for programming stuff
ln -s ~/iCloud/Programmieren ~/Programmieren

# path for sailing stuff
ln -s ~/iCloud/Segeln ~/Segeln

# path for system relevant stuff
ln -s ~/iCloud/System ~/System

# not a iCloud path but also very useful to have the desktop linked
ln -s ~/Desktop ~/Schreibtisch
