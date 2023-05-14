#!/bin/bash
#
#**********************************************************************************************
# Title: kubuntu_13.10_installationsskript.txt
# Description: Shell-skript zur Installation und Einrichtung von Kubuntu 13.10
# Author: Sebastian Sonntag
# Date: 2014-01-25
# Time: 17:00
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
#     - !libreoffice-calc, -draw, -impress, -math, -writer, -templates, -kde installieren
#     - !firefox mozplugger installieren
#     - !thunderbird thunderbird-locale-de installieren
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
#     - skype installieren
#     - flashplugin-installer installieren
#     - kubuntu-restricted-extras installieren
#     - gwenview kipi-plugins installieren
#     - kbibtex installieren
#     - openjdk-7-jre installieren
#     - icedtea-7-plugin installieren
#     - gimp gimp-resynthesizer language-pack-gnome-de-base installieren
#     - audex installieren
#     - htop installieren
#     - screen installieren
#     - handbrake-gtk installieren
#     - !inkscape installieren
#     - !arista gnome-icon-theme-full installieren
#     - rar unrar installieren
#     - avidemux installieren
#     - 0ad installieren
#     - winff installieren
#     - openssh-server installieren
#     - samba kdenetwork kdenetwork-filesharing installieren
#     - backintime-kde installieren
#     - lyx installieren
#     - sqlite3 sqliteman installieren
#     - yakuake installieren
#     - synergy installieren
#     - qtiplot installieren
#     - filezilla installieren
#     - tree installieren
#     - krfb krdc installieren
#     - unetbootin installieren
#     - kinfocenter hardinfo installieren
#     - hplip* installieren
#     - fdupes installieren
#     - unison unison-gtk installieren
#     - nautilus-dropbox installieren
#     - gscan2pdf installieren
#     - okular okular-extra-backends installieren
#     - djview4 djvulibre-plugin installieren
#     - pdfshuffler installieren
#     - diffpdf installieren
#     - trash-cli installieren
#     - spotify-client installieren
#     - mediathekview installieren
#     - libgxps-utils installieren
#   - Fünfter Installationsprozess [manuell]
#     - VPN Client von Cisco von Uni Siegen installieren
#     - Steam installieren
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
#     - Kurzbefehle und Gestensteuerung: Beispiele aktivieren, Konsole aktivieren
#     - Regionales: Land: checken ob Deutschland, Bevorzugte Sprache: Deutsch installieren und anwenden, Rechtschreibung: Deutsch(Deutschland)
#     - Erscheinungsbild der Arbeitsfläche: Thema: Air (Black), Mauszeigerdesign Oxygen black
#     - Standard-Komponenten: Email->Thunderbird; Webbrowser->Firefox
#     - Verhalten der Arbeitsfläche: 4 Arbeitsflächen, Wechsel: On-Screen Anzeige aktivieren, Bildschirmränder -> rechts unten: Raster anzeigen
#     - Anzeige und Monitor: Bildschirmsperre nach 15/30 Minuten mit Passwort nach 60 Sekunden 
#     - Drucker: 
#       - "hp-setup" mit sudo-Rechten in Terminal ausführen
#       - Drucker in Liste auswählen und hinzufügen
#       - Fax nicht mit aktivieren
#       - in Systemeinstellungen Drucker als Standard auswählen
#       - Testdatei drucken
#     - Eingabegeräte: Num immer einschalten, 105 Tasten-Tastatur
#     - Energieverwaltung: Batteriefüllstand (7, 5), wenn Ladestand kritisch: Herunterfahren, nie in Ruhezustand gehen
#     - Starten und Beenden: Dropbox checken, yakuake hinzufügen, System immer mit leerer Sitzung starten
#   - Dolphin:
#     - Werkzeugleisten einrichten: Ordnerhochbutton zwischen Pfeil links und rechts einfügen
#     - Ordnerverlinkung für unison, Dropbox und data unterhalb von Home anlegen
#   - Desktop:
#     - Uhr:
#       - Datum in digitaler Uhr anzeigen (ISO)
#       - Kalender: checken, ob USA deaktiviert und Deutschland (Feiertage) aktiv ist, Ereignisse anzeigen
#     - Aktivitäten Manager entfernen
#     - HP Systray-Anzeige ausblenden
#     - Kmenu-Knopf-Symbol auf Kubuntu-Icon ändern "~/unison/system/programm-daten/kmenu/logo-kubuntu.png"
#     - Symbol-Fensterleiste als Fensterleiste nutzen, die originale Fensterleiste entfernen
#       - Keine Vorschau der Fenster anzeigen
#       - Dolphin, Firefox, Thunderbird als Starter anlegen
#     - Arbeitsflächenumschalter in Taskleiste hinzufügen und zwischen Systray und Uhr platzieren
#     - Notizen-Widget auf Desktop hinzufügen
#     - Reihenfolge der Favoriten im Menü:
#       - Firefox
#       - Thunderbird
#       - Unison
#       - Taschenrechner
#       - Konsole
#       - Backintime
#       - Dolphin
#       - Systemeinstellungen
#     - Desktop: Rechtsklick -> Miniprogramme sperren
#   - Standarddateitypen KDE:
#     - Bilder: Gwenview 
#     - Musik: VLC
#     - Python-Skripte: Kate
#     - Vektorgrafiken: Inkscape
#     - Videos: VLC
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
#   - Filezilla:
#     - Backup-Datei mit Servern und Einstellungen laden
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
#       - dict.cc Suchmaschine hinzufügen
#       - Ubuntuusers Wiki Suchmaschine hinzufügen
#       - about:config: print: letter->a4
#       - keine Vorschau bei neuen Tabs
#     - Addons nachinstallieren bzw. einrichten:
#       - [alle Ubuntu-Addons deinstallieren]
#       - Xmarks (keine Search bars, Bookmarks from Server, don't ask for snyc)
#       - DownloadHelper (Speichern auf Arbeitsfläche, 20 Downloads max, kein Social Share)
#       - Bookmarks checker (rechts neben Home anordnen)
#       - Session Manager
#       - AdBlock Plus
#       - AdBlock Plus Popup-Addon
#       - German Dictionary
#     - Oberfläche:
#       - kleine Symbole verwenden
#       - Tab Grupen anzeigen
#       - keine Status/Addon-Bar
#   - Backintime:
#     - unter Kubuntu 13.10 (backintime 1.0.10) in "/usr/share/backintime/kde4/app.py" die Zeile 237 mit sudo Rechten auskommentieren
#     - In Sicherung einbeziehen:
#       - "/media/data/unison/"
#     - Von Sicherung ausschließen:
#       - "/media/data/unison/audio"
#     - Speicherort "/media/sonntux/core_500/backups/"
#   - Cisco Systems VPN Client Uni Siegen Version:
#     - auf "http://www.zimt.uni-siegen.de/dienste/netzwerk/vpn/" die Webinstallation starten
#     - Skript manuell downloaden und mit sudo Rechten ausführen
#     - Cisco Any Connect starten und "vpn.uni-siegen.de" als connect to eintragen
#   - ggf. Steam:
#     - Erstmals Programm öffnen und Clienten automatisch nachladen
#     - im Client Sprache auf Deutsch einstellen
#     - Bibliothek öffnen und gekaufte Spiele checken und entsprechend downloaden
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
#     alias ssh_uni='ssh -Yp 54322 sonntag@nolde.hep.physik.uni-siegen.de'
#     alias ssh_nolde='ssh -Y sonntag@nolde'
# 
#   - # git aliases
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






#=============================================================================================================================
### Beginn des eigentlichen Skriptteils #
#=============================================================================================================================






### Deklaration wichtiger Variablen #
list_of_apps="libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer libreoffice-templates libreoffice-kde firefox mozplugger thunderbird thunderbird-locale-de gcc g++ bash-completion kompare okteta kde-l10n-de soundkonverter lame partitionmanager texlive* kalzium pyrenamer kolourpaint4 vlc kdegames dvipng kile kile-l10n kstars automake autoconf ipython python-scipy python-matplotlib python-progressbar python-setuptools p7zip-* kate imagemagick aspell aspell-de hunspell hunspell-de-de nano lynx kde-wallpapers skype flashplugin-installer kubuntu-restricted-extras gwenview kipi-plugins kbibtex openjdk-7-jre icedtea-plugin audex htop screen handbrake-gtk inkscape arista gnome-icon-theme-full rar unrar avidemux 0ad winff openssh-server samba kdenetwork kdenetwork-filesharing gimp gimp-resynthesizer language-pack-gnome-de-base backintime-kde lyx sqlite3 sqliteman yakuake synergy qtiplot filezilla tree krfb krdc unetbootin kinfocenter hardinfo hplip* klatexformula fdupes unison unison-gtk nautilus-dropbox gscan2pdf okular okular-extra-backends djview4 djvulibre-plugin pdfshuffler diffpdf trash-cli spotify-client mediathekview libgxps-utils" 

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


# ### Eintragen von zusaetzlichen Quellen #
# ### VLC fuer Codecs #
# echo "deb http://download.videolan.org/pub/debian/stable/ /" | sudo tee -a /etc/apt/sources.list
# echo "#deb-src http://download.videolan.org/pub/debian/stable/ /" | sudo tee -a /etc/apt/sources.list
# wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -
# ### Handbrake #
# sudo add-apt-repository -y ppa:stebbins/handbrake-releases
# ### gscan2pdf #
# sudo add-apt-repository -y ppa:jeffreyratcliffe/ppa
# ### Spotify #
# sudo add-apt-repository -y 'deb http://repository.spotify.com/ stable non-free' 
# sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 94558F59
# ### Paketquelle updaten #
# sudo apt-get update
# echo "Repos und PPAs erfolgreich hinzugefuegt. Naechster Schritt: Alle im Vorfeld benoetigten Pakete (wajig, git, ...) installieren"
# echo ""
# sleep 5


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

# 
# ### Alias in .bashrc schreiben #
# echo "" >> ~/.bashrc && echo "# Update alias" >> ~/.bashrc && echo "alias sudo_update='sudo wajig update && sudo wajig dist-upgrade && sudo wajig autoremove && sudo wajig autoclean && sudo wajig clean'" >> ~/.bashrc
# echo "" >> ~/.bashrc && echo "# grub-repair alias" >> ~/.bashrc && echo "alias sudo_grub='sudo grub-install /dev/sda && sudo update-grub'" >> ~/.bashrc
# echo "" >> ~/.bashrc && echo "# SSH aliases" >> ~/.bashrc && echo "alias ssh_uni='ssh -Yp 54322 sonntag@nolde.hep.physik.uni-siegen.de'" >> ~/.bashrc && echo "alias ssh_nolde='ssh -Y sonntag@nolde'" >> ~/.bashrc
# echo "" >> ~/.bashrc && echo "# git aliases" >> ~/.bashrc && echo "alias git_linux='pwd > ~/.path_git_linux.txt && cd ~/unison/system/linux-pc/ && git gui && cd $(cat ~/.path_git_linux.txt) && rm ~/.path_git_linux.txt'" >> ~/.bashrc
# echo "" >> ~/.bashrc && echo "# rsync alias" >> ~/.bashrc && echo "alias rsync_to_core_500='pwd > ~/.path_git_bachelor.txt && cd ~/unison/system/linux-pc/skripte/ && chmod +x rsync_to_core_500.sh && ./rsync_to_core_500.sh && chmod -x rsync_to_core_500.sh && cd $(cat ~/.path_git_bachelor.txt) && rm ~/.path_git_bachelor.txt'" >> ~/.bashrc
# . ~/.bashrc
# echo "Update-/Upgrade-Befehl, SSH-Befehle, git-Befehle und grub-repair-Befehl erfolgreich in .bashrc eingetragen. Naechster Schritt: PC Neustarten"
# echo ""
