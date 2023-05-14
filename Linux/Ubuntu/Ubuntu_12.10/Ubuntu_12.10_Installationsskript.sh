#!/bin/bash
#
#**********************************************************************************************
# Title: ubuntu_12.10_installationsskript.txt
# Description: Shell-skript zur Installation und Einrichtung von Ubuntu 12.10
# Author: Sebastian Sonntag
# Date: 2013-02-14
# Time: 16:00
# License: 
#**********************************************************************************************


### Deklaration wichtiger Variablen #
list_of_apps="libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer firefox mozplugger thunderbird gcc g++ bash-completion meld ghex language-pack-de language-pack-de-base language-pack-gnome-de language-pack-gnome-de-base soundconverter lame gscan2pdf gparted texlive-full gelemental pyrenamer pinta vlc gnome-games dvipng unetbootin stellarium automake autoconf ipython python-scipy python-matplotlib python-progressbar p7zip-* imagemagick aspell aspell-de hunspell hunspell-de-de nano lynx pdfmod arista skype flashplugin-installer ttf-mscorefonts-installer ubuntu-restricted-extras gthumb nautilus-image-converter nautilus-open-terminal gwibber openjdk-7-jre icedtea-7-plugin htop screen handbrake-gtk geany geany-plugins inkscape dia-gnome libwmf-bin pstoedit sketch libnotify-bin shutter sound-juicer octave rar unrar avidemux hplip* 0ad xournal winff openssh-server virtualbox-ose virtualbox-guest-additions-iso preload samba system-config-samba cifs-utils gimp backintime-gnome lyx sqlite3 sqliteman indicator-weather root-system libroot-bindings-python-dev empathy account-plugin-icq"

list_of_codecs="libdvdcss2 gstreamer0.10-plugins-ugly libavcodec-extra-53 libavdevice-extra-53 libavformat-extra-53 libavutil-extra-51 libpostproc-extra-52 libswscale-extra-2 non-free-codecs"



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
echo "" >> ~/.bashrc && echo "# SSH alias" >> ~/.bashrc && echo "alias ssh_nolde='ssh -Xp 54322 sonntag@nolde.hep.physik.uni-siegen.de'" >> ~/.bashrc && . ~/.bashrc
echo "" >> ~/.bashrc && echo "# bzr_linux alias" >> ~/.bashrc && echo "alias bzr_linux='pwd > ~/.path.txt && cd ~/Dropbox/system/linux/trunk && bzr add && bzr commit && cd $(cat ~/.path.txt) && rm ~/.path.txt'" >> ~/.bashrc && . ~/.bashrc
echo "" >> ~/.bashrc && echo "# bzr_bachelor alias" >> ~/.bashrc && echo "alias bzr_bachelor='pwd > ~/.path.txt && cd ~/Dropbox/uni/work/projects/ba_pmt_wupsi/ba_thesis/trunk && bzr add && bzr commit && cd $(cat ~/.path.txt) && rm ~/.path.txt'" >> ~/.bashrc && . ~/.bashrc
echo "Update-/Upgrade-Befehl und SSH-Befehl erfolgreich in .bashrc eingetragen. Naechster Schritt: PC Neustarten"