#!/bin/bash
#
#**********************************************************************************************
# Title: kubuntu_12.10_installationsskript.txt
# Description: Shell-skript zur Installation und Einrichtung von Kubuntu 12.10
# Author: Sebastian Sonntag
# Date: 2013-04-11
# Time: 15:00
# License: 
#**********************************************************************************************


### Deklaration wichtiger Variablen #
list_of_apps="libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer firefox mozplugger thunderbird gcc g++ bash-completion kompare okteta kde-l10n-de soundkonverter lame gscan2pdf partitionmanager texlive* kalzium pyrenamer kolourpaint4 vlc kdegames dvipng unetbootin kile kile-l10n kstars automake autoconf ipython python-scipy python-matplotlib python-progressbar p7zip-* kate imagemagick aspell aspell-de hunspell hunspell-de-de nano lynx kde-wallpapers pdfmod skype flashplugin-installer ttf-mscorefonts-installer kubuntu-restricted-extras gwenview kipi-plugins kbibtex openjdk-7-jre icedtea-plugin choqok audex htop screen handbrake-gtk inkscape octave arista gnome-icon-theme-full rar unrar avidemux 0ad xournal winff openssh-server samba system-config-samba cifs-utils gimp gimp-resynthesizer backintime-kde lyx sqlite3 sqliteman root-system libroot-bindings-python-dev wajig yakuake synergy quicksynergy"

list_of_codecs="libdvdcss2 gstreamer0.10-plugins-ugly libavcodec-extra-53 libavdevice-extra-53 libavformat-extra-53 libavutil-extra-51 libpostproc-extra-52 libswscale-extra-2 non-free-codecs"





### Updaten des Systems #
echo "Das System wird aktualisiert und die Installation aller benoetigten Programme und Tools vorbereitet..."
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


### Installation von Preinstallationsprogrammen (bzr, Dropbox, Owncloud, ...) #
sudo apt-get install -y bzr bzr-explorer owncloud-client
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd &
echo "Dropbox, Owncloud-Client und bzr erfolgreich installiert. Naechster Schritt: restliche Programme installieren" 
sleep 5 


### Installation aller benoetiger Programme und Tools #
sudo apt-get install -y $list_of_apps
echo "Restliche Programme erfolgreich installiert. Naechster Schritt: Update-/Upgrade-Befehl in .bashrc eintragen" 
sleep 5


### Alias in .bashrc schreiben #
echo "" >> ~/.bashrc && echo "# Update alias" >> ~/.bashrc && echo "alias sudo_update='sudo wajig update && sudo wajig upgrade && sudo wajig autoremove && sudo wajig autoclean && sudo wajig clean'" >> ~/.bashrc && . ~/.bashrc
echo "" >> ~/.bashrc && echo "# SSH aliases" >> ~/.bashrc && echo "alias ssh_uni='ssh -Xp 54322 sonntag@nolde.hep.physik.uni-siegen.de'" >> ~/.bashrc && echo "alias ssh_nolde='ssh -X sonntag@nolde'" >> ~/.bashrc && . ~/.bashrc
#echo "" >> ~/.bashrc && echo "# bzr_linux alias" >> ~/.bashrc && echo "alias bzr_linux='pwd > ~/.path.txt && cd ~/Dropbox/system/linux/trunk && bzr add && bzr commit && cd $(cat ~/.path.txt) && rm ~/.path.txt'" >> ~/.bashrc && . ~/.bashrc
echo "" >> ~/.bashrc && echo "# bzr_bachelor alias" >> ~/.bashrc && echo "alias bzr_bachelor='pwd > ~/.path.txt && cd ~/ownCloud/uni/work/projects/ba_pmt_wupsi/ba_thesis/trunk && bzr add && bzr commit && cd $(cat ~/.path.txt) && rm ~/.path.txt'" >> ~/.bashrc && . ~/.bashrc
echo "" >> ~/.bashrc && echo "# grub-repair alias" >> ~/.bashrc && echo "alias sudo_grub='sudo grub-install /dev/sda && sudo update-grub'" >> ~/.bashrc && . ~/.bashrc
echo "Update-/Upgrade-Befehl, SSH-Befehle und bzr-Befehl(e) erfolgreich in .bashrc eingetragen. Naechster Schritt: PC Neustarten"