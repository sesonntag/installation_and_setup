#!/bin/bash
#
#*******************************************************************************
# Title: transcend.sh
# Description: Symlink transcend folders into home dir
# Author: Sebastian Sonntag
# Date: 2017-05-13
# License:
#*******************************************************************************

# collection of pictures path
ln -s ~/Volumes/Transcend/Bilder/Sammlung ~/Pictures/Sammlung

# 
ln -s ~/Volumes/Transcend/Bilder/SSW ~/Pictures/SSW

# not directly related to trancend but eiter way: flat documents linked into Dropbox
rm -r ~/Dropbox/Laura\ und\ Bastian/Wohnung
ln -s ~/Dokumente/Wohnung ~/Dropbox/Laura\ und\ Bastian/Wohnung

# movie links
ln -s /Volumes/Transcend/Clips ~/Movies/Clips
ln -s /Volumes/Transcend/Videos ~/Movies/Videos

# music links
ln -s /Volumes/Transcend/iTunes ~/Music/iTunes

# macOS software path
ln -s /Volumes/Transcend/System/macOS/Software/ ~/iCloud/System/Apple/macOS/Software

# university documents
ln -s /Volumes/Transcend/Uni ~/Uni
