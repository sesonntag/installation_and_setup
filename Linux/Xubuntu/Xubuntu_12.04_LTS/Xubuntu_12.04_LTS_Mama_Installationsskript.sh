#!/bin/bash
#
#**********************************************************************************************
# Title: xubuntu_12.04_lts_mama_installationsskript.sh
# Description: Shell-skript zur Installation und Einrichtung von Xubuntu 12.04 lts
# Author: Sebastian Sonntag
# Date: 2013-03-09
# Time: 18:30
# License: 
#**********************************************************************************************


### Deklaration wichtiger Variablen #
list_of_apps="openssh-server samba system-config-samba cifs-utils htop rar unrar flashplugin-installer ttf-mscorefonts-installer kubuntu-restricted-extras openjdk-7-jre icedtea-plugin aspell aspell-de hunspell hunspell-de-de nano p7zip-* automake autoconf vlc partitionmanager lame soundconverter libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer firefox mozplugger thunderbird gcc g++ bash-completion"

list_of_codecs="libdvdcss2 gstreamer0.10-plugins-ugly libavcodec-extra-53 libavdevice-extra-53 libavformat-extra-53 libavutil-extra-51 libpostproc-extra-52 libswscale-extra-2 non-free-codecs"





### Updaten des Systems #
echo "Das System wird aktualisiert und die Installation aller benoetigten Programme und Tools vorbereitet..."
sleep 5
sudo apt-get update 
sudo apt-get upgrade
echo "Das System wird nun eingerichtet. Es werden nun die zusaetzlich benoetigten Paketquellen eingetragen"
sleep 5


### Eintragen von zusaetzlichen Quellen #
sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list 
sudo apt-get --quiet update 
echo "Medibuntu-Repo erfolgreich hinzugefuegt. Naechster Schritt: medibuntu-keyring, libdvdcss2, sowie gstreamer0.10-plugins-ugly und andere Codecs installieren"
sleep 5


### Installation von Codecs # 
sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring 
sudo apt-get --quiet update
sudo apt-get install -y $list_of_codecs 
echo "medibuntu-keyring, libdvdcss2, gstreamer0.10-plugins-ugly und andere Codecs erfolgreich installiert. Naechster Schritt: restliche Programme installieren" 
sleep 5  


### Installation aller benoetiger Programme und Tools #
sudo apt-get install -y $list_of_apps
echo "Restliche Programme erfolgreich installiert. Naechster Schritt: Update-/Upgrade-Befehl in .bashrc eintragen" 
sleep 5


### Alias in .bashrc schreiben #
#echo "" >> ~/.bashrc && echo "# Update alias" >> ~/.bashrc && echo "alias sudo_update='sudo wajig update && sudo wajig dist-upgrade && #sudo wajig autoremove && sudo wajig autoclean && sudo wajig clean'" >> ~/.bashrc && . ~/.bashrc
#echo "Update-/Upgrade-Befehl erfolgreich in .bashrc eingetragen. Naechster Schritt: PC Neustarten"