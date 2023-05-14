#!/bin/bash
#
#**********************************************************************************************
# Title: Kubuntu 14.04 LTS Installationsskript.txt
# Description: Shell-skript zur Installation und Einrichtung von Kubuntu 14.04
# Author: Sebastian Sonntag
# Date: 2015-03-12
# Time: 17:00
# License: 
#**********************************************************************************************


#==========================================================
### Zu installierdene Programme ohne evtl. Abhängigkeiten #
#==========================================================
#   - Nullter Installationsprozess: [MANUELL!!!]
#     - Partnerquellen für Ubuntu in der /etc/apt/sources.list unten mit sudo-Rechten aktivieren und Paketquellen updaten (s.u.)
#   - Erster Installationsprozess:
#     - Repositories hinzufügen
#   - Zweiter Installationsprozess:
#     - Pre-Requirements installieren
#     - Codecs installieren
#   - Dritter Installationsprozess:
#     - Programme installieren
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
#   - Git einrichten:
#     - "git config --global user.name NAME" mit NAME=sonntux-desktop/notebook
#     - "git config --global user.email EMAIL@ADRESSE.de" mit EMAIL@ADRESSE.de=sonntux@sonntux-desktop/notebook
#     - "git config --global color.ui "auto""
#     - "git config --global pack.threads "0""
#   - Dropbox erstmals starten
#   - Systemeinstellungen:
#     - Kurzbefehle und Gestensteuerung: Beispiele aktivieren, Konsole aktivieren
#     - Regionales: Land: checken ob Deutschland, Bevorzugte Sprache: Deutsch installieren und anwenden, Rechtschreibung: Deutsch(Deutschland)
#     - Erscheinungsbild der Arbeitsfläche: Thema: Air (Black), Mauszeigerdesign Oxygen black
#     - Standard-Komponenten: Email->Thunderbird; Webbrowser->Firefox
#     - Verhalten der Arbeitsfläche: 4 Arbeitsflächen, Wechsel: On-Screen Anzeige aktivieren, Bildschirmränder -> rechts unten: Raster anzeigen
#     - Anzeige und Monitor: Bildschirmsperre nach 15/30 Minuten mit Passwort nach 60 Sekunden 
#     - Drucker: 
#       - LP2 als Default setzen
#     - Eingabegeräte: Num immer einschalten, 105 Tasten-Tastatur
#     - Energieverwaltung: Batteriefüllstand (7, 5), wenn Ladestand kritisch: Herunterfahren, nie in Ruhezustand gehen
#     - Starten und Beenden: Dropbox checken, yakuake hinzufügen, System immer mit leerer Sitzung starten
#   - Dolphin:
#     - Werkzeugleisten einrichten: Ordnerhochbutton zwischen Pfeil links und rechts einfügen
#     - Ordnerverlinkung für Uni, Datavrzeichnis, Augerdaten und Dropbox unterhalb von Home anlegen
#   - Desktop:
#     - Uhr:
#       - Datum in digitaler Uhr anzeigen (ISO)
#       - Kalender: checken, ob USA deaktiviert und Deutschland (Feiertage) aktiv ist, Ereignisse anzeigen
#     - Aktivitäten Manager entfernen
#     - HP Systray-Anzeige ausblenden
#     - Kmenu-Knopf-Symbol auf Kubuntu-Icon ändern "~/unison/system/programm-daten/kmenu/logo-kubuntu.png"
#     - Symbol-Fensterleiste als Fensterleiste nutzen, die originale Fensterleiste entfernen
#       - Keine Vorschau der Fenster anzeigen
#       - Dolphin, Firefox, Thunderbird, Kate, Konsole, VLC, Skype, Teamspeak als Starter anlegen
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
#   - Thunderbird:
#     - ...
#   - Cisco Systems VPN Client Uni Siegen Version:
#     - auf "http://www.zimt.uni-siegen.de/dienste/netzwerk/vpn/" die Webinstallation starten
#     - Skript manuell downloaden und mit sudo Rechten ausführen
#     - Cisco Any Connect starten und "vpn.uni-siege 24.x:n.de" als connect to eintragen
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
#======================================================
### Anmerkungen für nächste Kubuntu Version 14.04 LTS #
#======================================================






#=============================================================================================================================
### Beginn des eigentlichen Skriptteils #
#=============================================================================================================================






### Deklaration wichtiger Variablen #
list_of_apps="libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer libreoffice-templates libreoffice-kde firefox mozplugger thunderbird thunderbird-locale-de gcc g++ bash-completion kompare okteta kde-l10n-de soundkonverter lame partitionmanager texlive* kalzium pyrenamer kolourpaint4 vlc kdegames dvipng kile kile-l10n automake autoconf ipython python-scipy python-matplotlib python-progressbar python-setuptools p7zip-* kate imagemagick aspell aspell-de hunspell hunspell-de-de nano kde-wallpapers skype flashplugin-installer kubuntu-restricted-extras gwenview kipi-plugins kbibtex openjdk-7-jre icedtea-plugin audex htop screen handbrake-gtk inkscape arista gnome-icon-theme-full rar unrar avidemux 0ad winff openssh-server samba kdenetwork kdenetwork-filesharing gimp gimp-resynthesizer language-pack-gnome-de-base backintime-kde sqlite3 sqliteman filezilla tree unetbootin kinfocenter hardinfo hplip* klatexformula fdupes unison unison-gtk nautilus-dropbox gscan2pdf okular okular-extra-backends djview4 djvulibre-plugin pdfshuffler diffpdf trash-cli spotify-client mediathekview libgxps-utils nexuiz sauerbraten assaultcube ioquake3 hedgewars supertuxkart supertux smc smc-music ttf-dejavu-core kdemultimedia-kio-plugins kdesdk-kio-plugins ufw gufw" 

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
