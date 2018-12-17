#!/bin/bash
#
#**********************************************************************************************
# Title: ubuntu_13.10_installationsskript.txt
# Description: Shell-skript zur Installation und Einrichtung von Ubuntu 13.10
# Author: Sebastian Sonntag
# Date: 2013-12-27
# Time: 20:00
# License: 
#**********************************************************************************************


#==========================================================
### Zu installierdene Programme ohne evtl. Abhängigkeiten #
#==========================================================
#   - Nullter Installationsprozess: [MANUELL!!!]
#     - Partnerquellen für Ubuntu in der /etc/apt/sources.list unten mit sudo-Rechten aktivieren und Paketquellen updaten (s.u.)
#   - Erster Installationsprozess:
#     - VLC Repository hinzufügen
#     - Handbrake PPA hinzufügen
#     - gscan2pdf PPA hinzufügen
#     - Spotify Repository hinzufügen
#   - Zweiter Installationsprozess:
#     - wajig git git-gui 
#     - ttf-mscorefonts-installer root-system libroot-bindings-python-dev installieren
#     - Codecs installieren
#   - Dritter Installationsprozess:
#     - !libreoffice-calc, -draw, -impress, -math, -writer installieren
#     - firefox mozplugger installieren
#     - thunderbird installieren
#     - gcc installieren
#     - g++ installieren
#     - bash-completion 
#     - meld installieren
#     - ghex installieren
#     - language-pack-de language-pack-de-base language-pack-gnome-de language-pack-gnome-de-base installieren
#     - soundconverter installieren
#     - lame installieren
#     - gscan2pdf installieren
#     - gparted installieren
#     - texlive-full installieren
#     - gelemental installieren
#     - pyrenamer installieren
#     - pinta installieren
#     - vlc installieren
#     - dvipng installieren
#     - stellarium installieren
#     - automake installieren
#     - autoconf installieren
#     - ipython python-scipy python-matplotlib python-progressbar python-setuptools installieren
#     - p7zip-* installieren
#     - imagemagick installieren
#     - aspell aspell-de hunspell hunspell-de-de installieren
#     - nano installieren
#     - lynx installieren
#     - arista installieren
#     - skype installieren
#     - flashplugin-installer installieren
#     - ttf-mscorefonts-installer installieren
#     - ubuntu-restricted-extras installieren
#     - gthumb installieren
#     - nautilus-image-converter nautilus-open-terminal installieren
#     - openjdk-7-jre installieren
#     - icedtea-7-plugin installieren
#     - htop installieren
#     - screen installieren
#     - handbrake-gtk installieren
#     - geany geany-plugins installieren
#     - inkscape dia-gnome libwmf-bin pstoedit sketch installieren
#     - libnotify-bin installieren
#     - shutter installieren
#     - sound-juicer installieren
#     - rar unrar installieren
#     - avidemux installieren
#     - hplip* installieren
#     - 0ad installieren
#     - winff installieren
#     - openssh-server installieren
#     - samba system-config-samba cifs-utils installieren
#     - gimp gimp-resynthesizer installieren
#     - backintime-gnome installieren
#     - lyx installieren
#     - sqlite3 sqliteman installieren
#     - root-system libroot-bindings-python-dev installieren
#     - synergy quicksynergy installieren
#     - texstudio installieren
#     - vino remmina installieren
#     - filezilla installieren
#     - unetbootin installieren
#     - hardinfo installieren
#     - undistract-me installieren
#     - fdupes installieren
#     - unison unison-gtk installieren
#     - nautilus-dropbox installieren
#     - djview4 djvulibre-plugin installieren
#     - pdfshuffler installieren
#     - diffpdf installieren
#     - fityk installieren
#     - evince installieren
#     - trash-cli installieren
#     - spotify-client installieren
#     - mediathekview installieren
#     - jabref installieren
#     - tree installieren
#   - Vierter Installationsprozess [automatisch, nie Teil der Paketverwaltung]:
#     - Steam installieren
#   - Fünfter Installationsprozess [manuell]
#     - Intel Linux Grpahics Treiber
#       - aktuellste Version von Homepage runterladen
#       - aktuellste Version installieren
#       - Schlüssel des Repos hinzufügen
#       - Programm ausführen und benötigten Treiber installieren
#       - Neustarten
# 
# 
#======================
### System einrichten #
#======================
#   - Partnerquellen für Ubuntu in der "/etc/apt/sources.list" unten mit sudo-Rechten aktivieren, Paketquellen updaten
#   - Installationsskript aufrufen und durchlaufen lassen
#   - Neustarten
#   - Partitionen einhängen:
#     - Ordner "/media/data" mit sudo Rechten anlegen und Besitzer mit sudo Rechten auf sonntux:sonntux ändern "mkdir /media/data" sowie "chown -R sonntux:sonntux /media/data"
#     - ggf. Ordner "/media/backups" mit sudo Rechten anlegen und Besitzer mit sudo Rechten auf sonntux:sonntux ändern "mkdir /media/backups" sowie "chown -R sonntux:sonntux /media/backups"
#     - "/media/data" in fstab eintragen
#     - ggf. "/media/backups" in fstab eintragen
#   - Links in Home-Verzeichnis anlegen:
#     - Dropbox Verknüpfung in Home-Verzeichnis anlegen (Verweis auf "/media/data/dropbox/")
#     - unison Verknüpfung in Home-Verzeichnis anlegen (Verweis auf "/media/data/unison/")
#     - bin Verknüpfung in Home-Verzeichnis anlegen (Verweis auf "/media/data/unison/system/linux-pc/skripte/")
#   - System updaten
#   - Neustarten
#   - Aktuellsten Grafiktreiber installieren und ggf. Neustarten
#   - Unison-Profile aus "/media/data/unison/system/programm-daten/unison" für entsprechenden PC in "~/.unison/" einkopieren und Unison erstmals abgleichen lassen
#   - Git einrichten:
#     - "git config --global user.name NAME" mit NAME=sonntux-desktop/notebook
#     - "git config --global user.email EMAIL@ADRESSE.de" mit EMAIL@ADRESSE.de=sonntux@sonntux-desktop/notebook
#     - "git config --global color.ui "auto""
#     - "git config --global pack.threads "0""
#   - Dropbox erstmals starten
#   - SSH-Keys austauschen:
#      - via "ssh-keygen -t rsa" einen neuen rsa key produzieren
#      - diesen im Ordner "~/unison/system/programm-daten/ssh" mit Datum und der Angabe ob desktop, notebook oder uni-nolde speichern und alte löschen
#      - keys per Unison austauschen, so dass auf allen entsprechenden Systemen die aktuellen keys liegen
#      - per "cat ~/unison/system/programm-daten/ssh/xyz.pub >>~/.ssh/authorized_keys" die keys der jeweils anderen Systeme eintragen
#   - Systemeinstellungen:
#     - Darstellung: Erscheinungsbild: Icons in Pixelgröße 40 statt 48 im Dash zeigen, Verhalten: Arbeitsflächen und Desktopanzeige aktivieren
#     - Helligkeit und Sperren: Sperre deaktivieren
#     - Privatsphäre: Online Suchergebnisse deaktivieren
#     - Sprachen: fehlende Sprachen nachinstallieren, Regionale Formate: checken, ob Deutsch(Deutschland)
#     - Bluetooth: Aus
#     - Drucker: 
#       - "hp-setup" mit sudo-Rechten in Terminal ausführen
#       - Drucker in Liste auswählen und hinzufügen
#       - Fax nicht mit aktivieren
#       - in Systemeinstellungen Drucker als Standard auswählen
#       - Testdatei drucken
#     - Leistung: ggf. Ausschalten bei kritischem Akku
#     - Informationen: Vorgabe-Programme: Video-VLC, Foto-gThumb
#     - Zeit und Datum: Wochentag, Tag und Monat, monatlicher Kalender inklusive Kalenderwochen, Zeit am automatisch erkannten Ort
#   - Starteinstellungen:
#     - alle Startprogramme anzeigen: "cd /etc/xdg/autostart/ && sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop"
#     - Programme deaktivieren:
#       - Datensicherungsüberwachung
#     - Befehl hinzufügen:
#     - "setxkbmap de"
#   - Reihenfolge der Favoriten im Dock:
#     - Home-Ordner
#     - Firefox
#     - Thunderbird
#     - Unison
#     - Taschenrechner
#   - Vorlagen in Vorlagen-Ordner einfügen
#   - Standarddateitypen:
#     - Bilder: gThumb
#     - Musik: Rhythmbox
#     - Skript: geany
#     - Vektorgraphik: Inkscape
#     - Video: VLC
#   - Geany:
#     - Editor: visueller Zeilenumbruch, Einrückung 2, Typ ist Leerzeichen
#     - Werkzeuge: x-terminal-emulator -e "/bin/sh %c" -> gnome-terminal
#     - Terminal: Hintergrundfarbe "#300A24" anstelle von Schwarz
#   - Lyx:
#     - Einstellungen -> Rechtschreibung: Enchant, de_DE als alternative Sprache, Rechschreibung bei Eingabe prüfen
#   - Texstudio:
#     - Externen PDF betrachter nutzen
#   - gThumb:
#     - Ansicht -> Sortieren nach... -> Dateiname
#     - checken, ob: Einstellungen -> Betrachter -> In Fenster einpassen, falls größer
#   - HandBrake:
#     - Preferences -> Audio/Subtitles: Language: Deutsch
#   - LibreOffice:
#     - Autokorrektur Optionen: Tab als Vervollständigungsbefehl, Länge: 5
#   - Filezilla:
#     - Backup-Datei mit Servern und Einstellungen laden
#     - Keine Verzeichnisbäume anzeigen
#     - Filter für Dateien, die mit einem Punkt anfangen anlegen, damit diese ausgeblendet werden
#   - VLC:
#     - Nur eine Instanz erlauben
#     - Dateien im Ein-Instanz-Modus zur Wiedergabeliste hinzufügen
#   - Thunderbird 24.x:
#     - Ordner aus laden und als .thunderbird im Home-Ornder speichern
#     - Thunderbird erstmals starten und in offline Modus gehen
#   - Firefox 25.x:
#     - Grundsätzlich:
#       - key3.db und signons.sqlite einkopieren
#     - Einstellungen:
#       - Startseite von "about:start" nach "www.google.de" setzen
#       - Tabs und Fenster der letzten Sitzung anzeigen
#       - immer fragen wohin speichern
#     - Allgemein:
#       - about:config: print: letter->a4
#       - keine Vorschau bei neuen Tabs
#     - Addons nachinstallieren bzw. einrichten:
#       - Xmarks (keine Search bars, Bookmarks from Server, don't ask for snyc)
#       - DownloadHelper (Speichern auf Arbeitsfläche, 20 Downloads max, kein Social Share)
#       - Session Manager (rechts neben Searchbar und links von Home anordnen), letzte Sitzung von ~/unison/system/programm-daten/firefox/sessions/ nach ~/.mozilla/firefox/<profile>.default/sessions/ kopieren, dann/ansonsten deaktiveren
#       - Bookmarks checker (rechts neben Home anordnen)
#       - AdBlock Plus
#       - AdBlock Plus Popup-Addon
#       - German Dictionary
#       - unityfox
#     - Oberfläche:
#       - kleine Symbole verwenden
#       - Tab Grupen anzeigen
#       - keine Status/Addon-Bar
#   - Backintime:
#     - In Sicherung einbeziehen:
#       - "/media/data/unison/"
#     - Von Sicherung ausschließen:
#       - "/media/data/unison/audio"
#     - Speicherort "/media/sonntux/core_500/backups/"
#   - Steam:
#     - Steam manuell installieren von Homepage
#     - Erstmals Programm öffnen und Clienten automatisch nachladen
#     - im Client Sprache auf Deutsch einstellen
#     - Bibliothek öffnen und gekaufte Spiele checken
#     - Programm beenden und in Ordner "~/.steam/steam/" symbolischen Link "Steamapps" einfügen, der auf "~/unison/system/programm-daten/steam/steamapps/" verweist
#   - Cisco Systems VPN Client Uni Siegen Version:
#     - auf "http://www.zimt.uni-siegen.de/dienste/netzwerk/vpn/" die Webinstallation starten
#     - Skript manuell downloaden und mit sudo Rechten ausführen
#     - Cisco Any Connect starten und "vpn.uni-siegen.de" als connect to eintragen
# 
#       
#=======================================
### Konoslenbefehle für Aktualisierung #
#=======================================
#   - (Update-/Upgrade-Befehl (s.u.) als alias mit "sudo_update" in .bashrc eintragen)
#   - per wajig: sudo wajig update && sudo wajig dist-upgrade && sudo wajig autoremove && sudo wajig autoclean && sudo wajig clean
# 
#  
#====================
### Alias eintragen #
#====================
#   - # Update alias
#     alias sudo_update='sudo wajig update && sudo wajig dist-upgrade && sudo wajig autoremove && sudo wajig autoclean && sudo wajig clean'
# 
#   - # SSH aliases
#     alias ssh_uni='ssh -Xp 54322 sonntag@nolde.hep.physik.uni-siegen.de'
#     alias ssh_nolde='ssh -X sonntag@nolde'
# 
#   - # git aliases
#     alias git_bachelor='pwd > ~/.path_git_bachelor.txt && cd ~/unison/uni/work/projects/ba_pmt_wupsi/ba_thesis/ && git gui && cd $(cat ~/.path_git_bachelor.txt) && rm ~/.path_git_bachelor.txt'
#     alias git_linux='pwd > ~/.path_git_linux.txt && cd ~/unison/system/linux-pc/ && git gui && cd $(cat ~/.path_git_linux.txt) && rm ~/.path_git_linux.txt'
# 
#   - # grub-repair alias
#     alias sudo_grub='sudo grub-install /dev/sda && sudo update-grub'
#     
#   - # rsync alias
#     alias rsync_to_core_500='pwd > ~/.path_git_bachelor.txt && cd ~/unison/system/linux-pc/skripte/ && chmod +x rsync_to_core_500.sh && ./rsync_to_core_500.sh && chmod -x rsync_to_core_500.sh && cd $(cat ~/.path_git_bachelor.txt) && rm ~/.path_git_bachelor.txt'
# 
# 
#=================================
### Anmerkung zum Deinstallieren #
#=================================
# ggf. sind Abhängigkeitsprobleme und zusätlich relevante Pakete in der Archiv-Datei zu finden.
# 
# 
#======================================================
### Anmerkungen für nächste Kubuntu Version 14.04 LTS #
#======================================================
#   - gscan2pdf PPA ist nicht mehr notwendig, wenn Version >= 1.1.3




### Deklaration wichtiger Variablen #
list_of_apps="libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer firefox mozplugger thunderbird gcc g++ bash-completion meld ghex language-pack-de language-pack-de-base language-pack-gnome-de language-pack-gnome-de-base soundconverter lame gscan2pdf gparted texlive-full gelemental pyrenamer pinta vlc dvipng stellarium automake autoconf ipython python-scipy python-matplotlib python-progressbar python-setuptools p7zip-* imagemagick aspell aspell-de hunspell hunspell-de-de nano lynx arista skype flashplugin-installer ubuntu-restricted-extras gthumb nautilus-image-converter nautilus-open-terminal openjdk-7-jre icedtea-7-plugin htop screen geany geany-plugins inkscape dia-gnome libwmf-bin pstoedit sketch libnotify-bin shutter sound-juicer rar unrar avidemux hplip* 0ad winff openssh-server samba system-config-samba cifs-utils gimp gimp-resynthesizer backintime-gnome lyx sqlite3 sqliteman synergy quicksynergy texstudio vino remmina filezilla handbrake-gtk unetbootin hardinfo undistract-me fdupes unison unison-gtk nautilus-dropbox djview4 djvulibre-plugin pdfshuffler diffpdf fityk evince trash-cli spotify-client mediathekview jabref tree" 

list_of_prerequisists="wajig git git-gui"

list_of_dialog_packages="ttf-mscorefonts-installer root-system libroot-bindings-python-dev"

list_of_codecs="libdvdcss2 libavcodec-extra-53 libavdevice-extra-53 libavformat-extra-53 libavutil-extra-51 libpostproc-extra-52 libswscale-extra-2 libquicktime2 libopus0 opus-tools libxvidcore4 gstreamer0.10-plugins-base gstreamer0.10-plugins-good gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-ffmpeg gstreamer0.10-alsa gstreamer0.10-fluendo-mp3 phonon-backend-gstreamer"





### Updaten des Systems #
echo ""
echo "Das System wird aktualisiert und die Installation aller benoetigten Programme und Tools vorbereitet..."
sleep 5
sudo apt-get update 
sudo apt-get upgrade
echo "Das System wird nun eingerichtet. Es werden nun die zusaetzlich benoetigten Paketquellen eingetragen"
echo ""
sleep 5


### Eintragen von zusaetzlichen Quellen #
### VLC fuer Codecs #
echo "deb http://download.videolan.org/pub/debian/stable/ /" | sudo tee -a /etc/apt/sources.list
echo "#deb-src http://download.videolan.org/pub/debian/stable/ /" | sudo tee -a /etc/apt/sources.list
wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -
### Handbrake #
sudo add-apt-repository -y ppa:stebbins/handbrake-releases
### gscan2pdf #
sudo add-apt-repository -y ppa:jeffreyratcliffe/ppa
### Spotify #
sudo add-apt-repository -y 'deb http://repository.spotify.com/ stable non-free' 
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 94558F59
### Paketquelle updaten #
sudo apt-get update
echo "Repos und PPAs erfolgreich hinzugefuegt. Naechster Schritt: Alle im Vorfeld benoetigten Pakete (wajig, git, ...) installieren"
echo ""
sleep 5


### Installation von prerequisists # 
sudo apt-get install -y $list_of_prerequisists
echo "Alle im Vorfeld benoetigten Pakete (wajig, git, ...) erfolgreich installiert. Naechster Schritt: Dialog-packages installieren"
echo "" 
sleep 5


### Installation von dialog packages # 
sudo apt-get install -y $list_of_dialog_packages
echo "Dialog-packages erfolgreich installiert. Naechster Schritt: Codecs installieren"
echo "" 
sleep 5


### Installation von Codecs # 
sudo apt-get install -y $list_of_codecs 
echo "Codecs erfolgreich installiert. Naechster Schritt: Programme installieren" 
echo ""
sleep 5


### Installation aller benoetiger Programme und Tools, die ueber die Paketverwaltung installiert werden ##
sudo apt-get install -y $list_of_apps
echo "Programme erfolgreich installiert. Naechster Schritt: Aliases in .bashrc eintragen"  
echo ""
sleep 5


### Alias in .bashrc schreiben #
echo "" >> ~/.bashrc && echo "# Update alias" >> ~/.bashrc && echo "alias sudo_update='sudo wajig update && sudo wajig dist-upgrade && sudo wajig autoremove && sudo wajig autoclean && sudo wajig clean'" >> ~/.bashrc
echo "" >> ~/.bashrc && echo "# grub-repair alias" >> ~/.bashrc && echo "alias sudo_grub='sudo grub-install /dev/sda && sudo update-grub'" >> ~/.bashrc
echo "" >> ~/.bashrc && echo "# SSH aliases" >> ~/.bashrc && echo "alias ssh_uni='ssh -Xp 54322 sonntag@nolde.hep.physik.uni-siegen.de'" >> ~/.bashrc && echo "alias ssh_nolde='ssh -X sonntag@nolde'" >> ~/.bashrc
echo "" >> ~/.bashrc && echo "# git alias" >> ~/.bashrc && echo "alias git_linux='pwd > ~/.path_git_linux.txt && cd ~/unison/system/linux-pc/ && git gui && cd $(cat ~/.path_git_linux.txt) && rm ~/.path_git_linux.txt'" >> ~/.bashrc
echo "" >> ~/.bashrc && echo "# rsync alias" >> ~/.bashrc && echo "alias rsync_to_core_500='pwd > ~/.path_git_bachelor.txt && cd ~/unison/system/linux-pc/skripte/ && chmod +x rsync_to_core_500.sh && ./rsync_to_core_500.sh && chmod -x rsync_to_core_500.sh && cd $(cat ~/.path_git_bachelor.txt) && rm ~/.path_git_bachelor.txt'" >> ~/.bashrc
. ~/.bashrc
echo "Update-/Upgrade-Befehl, SSH-Befehle, git-Befehle und grub-repair-Befehl erfolgreich in .bashrc eingetragen. Naechster Schritt: PC Neustarten"
echo ""
