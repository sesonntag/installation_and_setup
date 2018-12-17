#!/bin/bash
#
#**********************************************************************************************
# Title: kubuntu_13.04_installationsskript.txt
# Description: Shell-skript zur Installation und Einrichtung von Kubuntu 13.04
# Author: Sebastian Sonntag
# Date: 2013-10-11
# Time: 22:00
# License: 
#**********************************************************************************************


#==========================================================
### Zu installierdene Programme ohne evtl. Abhängigkeiten #
#==========================================================
#   - Nullter Installationsprozess: [MANUELL!!!]
#     - Partnerquellen für Ubuntu in der /etc/apt/sources.list unten mit sudo-Rechten aktivieren und Paketquellen updaten (s.u.)
#   - Erster Installationsprozess:
#     - Handbrake PPA hinzufügen
#     - Sage PPA hinzufügen
#     - gscan2pdf PPA hinzufügen
#     - Spotify Repository hinzufügen
#     - VLC Repository hinzufügen
#   - Zweiter Installationsprozess:
#     - codecs installieren
#     - wajig git git-gui installieren
#   - Dritter Installationsprozess:
#     - !libreoffice-calc, -draw, -impress, -math, -writer installieren
#     - !firefox mozplugger installieren
#     - !thunderbird installieren
#     - gcc installieren
#     - g++ installieren
#     - bash-completion installieren
#     - kompare installieren
#     - okteta installieren
#     - kde-l10n-de installieren
#     - soundKonverter installieren
#     - lame installieren
#     - partitionmanager installieren
#     - texlive* installieren
#     - kalzium installieren
#     - !pyrenamer installieren
#     - kolourpaint4 installieren
#     - vlc installieren
#     - kdegames installieren
#     - dvipng installieren
#     - usb-creator-kde installieren
#     - kile kile-l10n installieren
#     - kstars installieren
#     - automake installieren
#     - autoconf installieren
#     - ipython python-scipy python-matplotlib python-progressbar python-setuptools installieren
#     - p7zip-* installieren
#     - kate installieren
#     - ImageMagick installieren
#     - aspell aspell-de installieren
#     - hunspell hunspell-de-de installieren
#     - nano installieren
#     - lynx installieren
#     - kde-wallpapers installieren
#     - pdfmod installieren
#     - skype installieren
#     - flashplugin-installer installieren
#     - ttf-mscorefonts-installer installieren
#     - kubuntu-restricted-extras installieren
#     - gwenview kipi-plugins installieren
#     - kbibtex installieren
#     - openjdk-7-jre installieren
#     - icedtea-7-plugin installieren
#     - choqok installieren
#     - gimp gimp-resynthesizer installieren
#     - audex installieren
#     - htop installieren
#     - screen installieren	
#     - handbrake-gtk installieren
#     - !inkscape installieren
#     - octave installieren
#     - !arista gnome-icon-theme-full installieren
#     - rar unrar installieren
#     - avidemux installieren
#     - 0ad installieren
#     - xournal installieren
#     - winff installieren
#     - openssh-server installieren
#     - virtualbox virtualbox-qt virtualbox-guest-additions-iso installieren
#     - samba system-config-samba cifs-utils installieren
#     - backintime-kde installieren
#     - lyx installieren
#     - sqlite3 sqliteman installieren
#     - root-system libroot-bindings-python-dev installieren
#     - wajig installieren
#     - yakuake installieren
#     - synergy installieren
#     - scidavis installieren
#     - filezilla installieren
#     - tree installieren
#     - keepassx installieren
#     - krfb krdc installieren
#     - unetbootin installieren
#     - kinfocenter hardinfo installieren
#     - sage installieren
#     - undistract-me installieren
#     - hplip* installieren
#     - klatexformula installieren
#     - fslint installieren
#     - fdupes installieren
#     - unison unison-gtk installieren
#     - grsync installieren
#     - nautilus-dropbox installieren
#     - gscan2pdf installieren
#     - spyder installieren
#     - okular okular-extra-backends installieren
#     - djview4 djvulibre-plugin installieren
#     - mysql-server installieren
#     - pdfshuffler installieren
#     - diffpdf installieren
#     - fityk installieren
#     - evince installieren
#     - trash-cli installieren
#     - spotify-client installieren
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
#   - Partnerquellen für Ubuntu in der /etc/apt/sources.list unten mit sudo-Rechten aktivieren, Paketquellen updaten
#   - /media/data in fstab eintragen
#   - ggf. /media/backups in fstab eintragen
#   - Dropbox Verknüpfung in Home-Verzeichnis anlegen (Verweis auf /media/data/dropbox/)
#   - unison Verknüpfung in Home-Verzeichnis anlegen (Verweis auf /media/data/unison/)
#   - bin Verknüpfung in Home-Verzeichnis anlegen (Verweis auf /media/data/unison/system/linux-pc/skripte/)
#   - System updaten
#   - Neustarten
#   - Aktuellsten Grafiktreiber installieren und ggf. Neustarten
#   - (Installation aller restlichen benötigten Programme)
#   - Unison-Profile aus /media/data/unison/system/programm-daten/unison für entsprechenden PC in ~/.unison/ einkopieren
#   - Neustarten
#   - Git einrichten:
#     - "git config --global user.name NAME" mit NAME=sonntux-desktop/notebook
#     - "git config --global user.email EMAIL@ADRESSE.de" mit EMAIL@ADRESSE.de=sonntux@sonntux-desktop/notebook
#     - "git config --global color.ui "auto""
#     - "git config --global pack.threads "0""
#   - Dropbox erstmals starten
#   - Systemeinstellungen:
#     - Kurzbefehle und Gestensteuerung: Beispiele aktivieren, Konsole aktivieren
#     - Regionales: Land: checken ob Deutschland, Bevorzugte Sprache: Deutsch installieren und anwenden, Rechtschreibung: Deutsch(Deutschland)
#     - Standard-Komponenten: Email->Thunderbird; Webbrowser->Firefox
#     - Verhalten der Arbeitsfläche: 4 Arbeitsflächen, Wechsel: On-Screen Anzeige aktivieren, Bildschirmränder -> rechts unten: Raster anzeigen
#     - Anzeige und Monitor: Bildschirmsperre nach 15 Minuten mit Passwort nach 60 Sekunden 
#     - Drucker: 
#       - "hp-setup" mit sudo-Rechten in Terminal ausführen
#       - Drucker in Liste auswählen und hinzufügen
#       - in Systemeinstellungen Drucker als Standard auswählen (nicht das Fax-Gerät)
#       - nochmals "hp-setup" mit sudo-Rechten in Terminal ausführen
#       - Testdatei drucken
#     - Eingabegeräte: Num immer einschalten, 105 Tasten-Tastatur
#     - Energieverwaltung: Batteriefüllstand (7, 5), wenn Ladestand kritisch: Herunterfahren
#     - Starten und Beenden: Dropbox checken, yakuake hinzufügen, System immer mit leerer Sitzung starten
#   - Dolphin:
#     - Einrichten -> Dienste -> Attach to Thunderbird installieren
#     - Werkzeugleisten einrichten: Ordnerhochbutton zwischen Pfeil links und rechts einfügen
#     - Ordnerverlinkung für unison und data unterhalb von Home anlegen
#   - Desktop:
#     - Uhr:
#       - Datum in digitaler Uhr anzeigen (ISO)
#       - Kalender: checken, ob USA deaktiviert und Deutschland (Feiertage) aktiv ist, Ereignisse anzeigen
#     - Aktivitäten Manager entfernen
#     - Arbeitsflächenwechseler in Taskleiste hinzufügen
#     - Wetter-Widget in Systemabschnitt der Kontrollleiste hinzufügen
#     - Notizen-Widget auf Desktop hinzufügen
#     - Reihenfolge der Favoriten im Menü:
#       - Firefox
#       - Thunderbird
#       - Unison
#       - Taschenrechner
#       - Konsole
#       - Synergy
#       - Ordner
#       - Systemeinstellungen
#     - Desktop: Rechtsklick -> Miniprogramme sperren
#   - Standarddateitypen KDE:
#     - Bilder: Gwenview 
#     - Musik: Amarok
#     - Vektorgrafik: Inkscape
#     - Video: VLC
#   - HandBrake:
#     - Preferences -> Audio/Subtitles: Language: Deutsch
#   - LibreOffice:
#     - Extras -> Autokorrektur Optionen: Wortvervollständigung mit Tab, Länge: 5
#   - kate: 
#     - Erweiterungen: Terminal Werkzeug Ansicht aktivieren, Sync mit aktuellem Verzeichnis einstellen
#     - Erscheinungsbild: hebe Bereich zwischen zugehörigen Klammern hervor, alle Randbereiche aktivieren
#     - Öffnen/Speichern: Zeilenlängen Limit: 4096 -> 0
#   - Kile:
#     - Portierung auf KDE4? -> ja
#     - Keine Tipps zum Programmstart anzeigen
#     - Autor: Sebastian Sonntag, Dokumentenklasse: a4paper, 10pt
#     - PDFLaTeX -> PDF (Okular)
#     - Erscheinungsbild: hebe Bereich zwischen zugehörigen Klammern hervor, alle Randbereiche aktivieren
#     - Editing: Rechtschreibkorrektur Deutsch(Deutschland), Prüfen bei Eingabe
#     - Öffnen/Speichern: Zeilenlängen Limit: 4096 -> 0
#   - Steam:
#     - Erstmals Programm öffnen und Clienten automatisch nachladen
#     - Bibliothek öffnen und gekaufte Spiele checken
#     - Programm beenden und backupen des Ordners "Steamapps" in Ordner ".steam/steam/" und symbolischen Link "Steamapps" einfügen, der auf "~/unison/system/programm-daten/steam/steamapps/" verweist
#   - Filezilla:
#     - Backup-Datei mit Servern und Einstellungen laden
#     - Keine Verzeichnisbäume anzeigen
#     - Filter für Dateien, die mit einem Punkt anfangen anlegen, damit diese ausgeblendet werden
#   - Thunderbird 24.x:
#     - Ordner aus laden und als .thunderbird im Home-Ornder speichern
#     - Thunderbird erstmals starten und in offline Modus gehen
#   - Firefox 24.x:
#     - Grundsätzlich:
#       - key3.db und signons.sqlite einkopieren
#     - Einstellungen:
#       - Startseite von "about:start" nach "www.google.de" setzen
#       - Tabs und Fenster der letzten Sitzung anzeigen
#       - immer fragen wohin speichern
#     - Allgemein: 
#       - dict.cc Suchmaschine hinzufügen
#       - Ubuntuusers Wiki Suchmaschine hinzufügen
#       - about:config: print: letter->a4
#       - keine Vorschau bei neuen Tabs
#     - Addons nachinstallieren bzw. einrichten:
#       - [alle Ubuntu-Addons deinstallieren]
#       - Xmarks (keine Search bars, Bookmarks from Server, don't ask for snyc)
#       - DownloadHelper (Speichern auf Arbeitsfläche, 20 Downloads max, kein Social Share)
#       - Link Checker (rechts neben Searchbar anordnen)
#       - AdBlock Plus
#       - AdBlock Plus Popup-Addon
#       - German Dictionary
#     - Oberfläche:
#       - kleine Symbole verwenden
#       - keine Status/Addon-Bar
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
#==================================================
### Anmerkungen für nächste Kubuntu Version 13.10 #
#==================================================
#   - gscan2pdf PPA ist nicht mehr notwendig, wenn Version >= 1.1.3






#=============================================================================================================================
### Beginn des eigentlichen Skriptteils #
#=============================================================================================================================






### Deklaration wichtiger Variablen #
list_of_apps="libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer firefox mozplugger thunderbird gcc g++ bash-completion kompare okteta kde-l10n-de soundkonverter lame partitionmanager texlive* kalzium pyrenamer kolourpaint4 vlc kdegames dvipng usb-creator-kde kile kile-l10n kstars automake autoconf ipython python-scipy python-matplotlib python-progressbar python-setuptools p7zip-* kate imagemagick aspell aspell-de hunspell hunspell-de-de nano lynx kde-wallpapers pdfmod skype flashplugin-installer ttf-mscorefonts-installer kubuntu-restricted-extras gwenview kipi-plugins kbibtex openjdk-7-jre icedtea-plugin choqok audex htop screen inkscape octave arista gnome-icon-theme-full rar unrar avidemux 0ad xournal winff openssh-server virtualbox virtualbox-qt virtualbox-guest-additions-iso samba system-config-samba cifs-utils gimp gimp-resynthesizer backintime-kde lyx sqlite3 sqliteman root-system libroot-bindings-python-dev yakuake synergy scidavis filezilla tree keepassx krfb krdc handbrake-gtk unetbootin kinfocenter hardinfo sagemath-upstream-binary undistract-me hplip* klatexformula fslint fdupes unison unison-gtk grsync nautilus-dropbox gscan2pdf spyder okular okular-extra-backends djview4 djvulibre-plugin mysql-server pdfshuffler diffpdf fityk evince trash-cli spotify-client"

list_of_prerequisists="wajig git git-gui"

list_of_codecs="libdvdcss2 libavcodec-extra-53 libavdevice-extra-53 libavformat-extra-53 libavutil-extra-51 libpostproc-extra-52 libswscale-extra-2 libquicktime2 non-free-codecs libopus0 opus-tools libxvidcore4 gstreamer0.10-plugins-base gstreamer0.10-plugins-good gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-ffmpeg gstreamer0.10-alsa gstreamer0.10-fluendo-mp3 phonon-backend-gstreamer"





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
### Sage #
sudo add-apt-repository -y ppa:aims/sagemath
### gscan2pdf #
sudo add-apt-repository -y ppa:jeffreyratcliffe/ppa
### Spotify #
sudo add-apt-repository -y 'deb http://repository.spotify.com/ stable non-free' 
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 94558F59
### Steam #
wget http://media.steampowered.com/client/installer/steam.deb
sudo wajig install steam.deb
rm steam.deb
### Paketquelle updaten #
sudo apt-get update
echo "Repos und PPAs erfolgreich hinzugefuegt. Naechster Schritt: Alle im Vorfeld benötigten Pakete (wajig, git, ...) installieren"
echo ""
sleep 5


### Installation von wajig und git # 
sudo apt-get install -y $list_of_prerequisists
echo "Alle im Vorfeld benötigten Pakete (wajig, git, ...) erfolgreich installiert. Naechster Schritt: Codecs installieren"
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
echo "" >> ~/.bashrc && echo "# git aliases" >> ~/.bashrc && echo "alias git_bachelor='pwd > ~/.path_git_bachelor.txt && cd ~/unison/uni/work/projects/ba_pmt_wupsi/ba_thesis/ && git gui && cd $(cat ~/.path_git_bachelor.txt) && rm ~/.path_git_bachelor.txt'" >> ~/.bashrc && echo "alias git_linux='pwd > ~/.path_git_linux.txt && cd ~/unison/system/linux-pc/ && git gui && cd $(cat ~/.path_git_linux.txt) && rm ~/.path_git_linux.txt'" >> ~/.bashrc
echo "" >> ~/.bashrc && echo "# rsync alias" >> ~/.bashrc && echo "alias rsync_to_core_500='pwd > ~/.path_git_bachelor.txt && cd ~/unison/system/linux-pc/skripte/ && chmod +x rsync_to_core_500.sh && ./rsync_to_core_500.sh && chmod -x rsync_to_core_500.sh && cd $(cat ~/.path_git_bachelor.txt) && rm ~/.path_git_bachelor.txt'" >> ~/.bashrc
. ~/.bashrc
echo "Update-/Upgrade-Befehl, SSH-Befehle, git-Befehle und grub-repair-Befehl erfolgreich in .bashrc eingetragen. Naechster Schritt: PC Neustarten"
echo ""