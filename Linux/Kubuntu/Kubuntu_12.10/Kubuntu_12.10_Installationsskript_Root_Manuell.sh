#!/bin/bash
#
#**********************************************************************************************
# Title: kubuntu_12.10_installationsskript.txt
# Description: Shell-skript zur Installation und Einrichtung von Kubuntu 12.10
# Author: Sebastian Sonntag
# Date: 2013-02-05
# Time: 11:00
# License: 
#**********************************************************************************************


### Deklaration wichtiger Variablen #
list_of_apps="libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer firefox mozplugger thunderbird gcc g++ bash-completion kompare okteta kde-l10n-de soundkonverter lame gscan2pdf partitionmanager texlive* kalzium pyrenamer kolourpaint4 vlc kdegames dvipng unetbootin kile kile-l10n kstars automake autoconf ipython python-scipy python-matplotlib python-progressbar p7zip-* kate imagemagick aspell aspell-de hunspell hunspell-de-de nano lynx kde-wallpapers pdfmod skype flashplugin-installer ttf-mscorefonts-installer kubuntu-restricted-extras gwenview kipi-plugins kbibtex openjdk-7-jre icedtea-plugin choqok audex htop screen handbrake-gtk inkscape octave arista gnome-icon-theme-full rar unrar avidemux 0ad xournal winff openssh-server samba system-config-samba cifs-utils gimp backintime-kde lyx sqlite3 sqliteman"

list_of_codecs="libdvdcss2 gstreamer0.10-plugins-ugly libavcodec-extra-53 libavdevice-extra-53 libavformat-extra-53 libavutil-extra-51 libpostproc-extra-52 libswscale-extra-2 non-free-codecs"

list_of_root_prerequisites="subversion dpkg-dev make g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev gfortran libssl-dev libpcre3-dev xlibmesa-glu-dev libglew1.5-dev libftgl-dev libmysqlclient-dev libfftw3-dev cfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev xfs xfstt t1-xfree86-nonfree ttf-xfree86-nonfree ttf-xfree86-nonfree-syriac xfonts-75dpi xfonts-100dpi"

root_version="5-34-04"



### Updaten des Systems #
echo "Das System wird aktualisiert und die Installation aller benoetigten Programme und Tools vorbereitet..."
echo "Im spaeteren Verlauf wird ROOT in Version $root_version kompiliert und installiert"
sleep 5
sudo apt-get update 
sudo apt-get upgrade
echo "Das System wird nun eingerichtet. Es werden nun die zusaetzlich benoetigten Paketquellen eingetragen"
sleep 5


### Eintragen von zusaetzlichen Quellen #
sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo apt-get update 
sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list 
sudo apt-get --quiet update 
echo "HandBrake-PPA und Medibuntu-Repo erfolgreich hinzugefuegt. Naechster Schritt: medibuntu-keyring, libdvdcss2, sowie gstreamer0.10-plugins-ugly und andere Codecs installieren"
sleep 5


### Installation von Codecs # 
sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring 
sudo apt-get --quiet update
sudo apt-get install -y $list_of_codecs 
echo "medibuntu-keyring, libdvdcss2, gstreamer0.10-plugins-ugly und andere Codecs erfolgreich installiert. Naechster Schritt: Dropbox installieren" 
sleep 5 


### Installation von Preinstallationsprogrammen (Dropbox, encfs, ...) #
sudo apt-get install -y nautilus-dropbox encfs
sudo usermod -aG fuse sonntux 
mkdir ~/filebox 
encfs ~/Dropbox/container ~/filebox -o nonempty
echo "Dropbox und encfs erfolgreich installiert. encfs erfolgreich eingehangen. Naechster Schritt: restliche Programme installieren" 
sleep 5 


### Installation aller benoetiger Programme und Tools #
sudo apt-get install -y $list_of_apps
echo "Restliche Programme erfolgreich installiert. Naechster Schritt: Update-/Upgrade-Befehl in .bashrc eintragen" 
sleep 5


### Alias in .bashrc schreiben #
echo "" >> ~/.bashrc && echo "# Update alias" >> ~/.bashrc && echo "alias sudo_update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove --purge && sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'" >> ~/.bashrc && . ~/.bashrc
echo "" >> ~/.bashrc && echo "# SSH alias" >> ~/.bashrc && echo "alias ssh_nolde='ssh -Xp 54322 sonntag@nolde.hep.physik.uni-siegen.de'" >> ~/.bashrc && . ~/.bashrc && echo "Update-/Upgrade-Befehl und SSH-Befehl erfolgreich in .bashrc eingetragen. Naechster Schritt: ROOT $root_version kompilieren und unter /opt installieren" 
sleep 5 


### Root laden, kompilieren und installieren #
sudo apt-get install -y $list_of_root_prerequisites
cd /opt 
sudo svn co http://root.cern.ch/svn/root/tags/v$root_version 
sudo mv v$root_version/ root_$root_version/ 
cd root_$root_version 
sudo ./configure 
sudo make -j 4 
sudo chown -cR sonntux /opt/root_$root_version/* 
echo "" >> ~/.bashrc && echo "# ROOT $root_version" >> ~/.bashrc && echo ". /opt/root_$root_version/bin/thisroot.sh" >> ~/.bashrc && . ~/.bashrc 
echo "ROOT $root_version erfolgreich kompiliert und installiert. Naechster Schritt: PC Neustarten"
