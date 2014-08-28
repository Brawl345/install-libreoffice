#!/bin/bash
#
# LibreOffice 4 Installer v1.0
# Dieses Skript installiert LibreOffice 4 - auch für eine Aktualisierung geeignet!
# © 2013-2014 Andreas Bielawski (http://wiidatabase.de/)
# Veröffentlicht unter der GPL v3
# Benötigte Pakete: tar, libnotify-bin
#
#
# Was du tun musst:
# 0. Prüfe bitte, ob du die neueste Version von LibreOffice wirklich benötigst und siehe nach, ob dir die
#    Version in den Paketquellen gerecht ist!
# 1. Downloade LibreOffice von hier: http://de.libreoffice.org/download/
# 	 LibreOffice Testing: http://de.libreoffice.org/download/testversionen/
# 2a. Passe die Variablen an (Standard: Alle ".tar.gz"s im "~/Downloads" Ordner mit Standardnamen)
# 2b. Mache dieses Skript ausführbar ("chmod +x install-lo4.sh" im Terminal, muss nur einmal gemacht werden!)
# 3. Führe das Skript aus ("./install-lo4.sh" im Terminal)

# Variablen setzen
# Anpassen, wenn nötig!
PFAD="$HOME/Downloads" # Pfad, in dem die .tar.gz gespeichert sind
LOINSTALL="LibreOffice*_4.*_Linux_*_deb.tar.gz" # wird für den Check gebraucht
LOINSTALLFOLDER="LibreOffice*_4.*_Linux_*_deb/DEBS" # wird für den Check gebraucht
LOLANGUAGE="LibreOffice*_4.*_Linux_*_deb_langpack_de.tar.gz" # wird für den Check gebraucht
LOLANGUAGEFOLDER="LibreOffice*_4.*_Linux_*_deb_langpack_de/DEBS" # wird für den Check gebraucht
LOHELP="LibreOffice*_4.*_Linux_*_deb_helppack_de.tar.gz" # wird für den Check gebraucht
LOHELPFOLDER="LibreOffice*_4.*_Linux_*_deb_helppack_de/DEBS" # wird für den Check gebraucht
INSTALLHELP="n" # Hilfe installieren? (j, n)

### AB HIER NICHTS MEHR ANPASSEN! ###
CURRENTVER="1.0.1"

# Wechsle ins Verzeichnis - Unentpackte .tar.gz nur dort!
cd $PFAD
echo ""
echo "		LibreOffice 4 Installer v$CURRENTVER"
echo "		https://github.com/Brawl345/install-libreoffice/"
echo ""

# Prüft, ob die Installationsdaten wirklich existieren.	   
if [ -f $LOINSTALL ];
then
   echo "Installationsdatei existiert - Fahre fort..."
else
   echo "FEHLER! Installationsdatei existiert nicht"
   echo "Downloade sie bitte von http://de.libreoffice.org/download/"
   exit
fi
 
if [ -f $LOLANGUAGE ];
then
   echo "Sprachdatei existiert! Beginne mit der Installation..."
else
   echo "FEHLER! Sprachdatei existiert nicht! "
   echo "Downloade sie bitte von http://de.libreoffice.org/download/"
   exit
fi

if [ "$INSTALLHELP" == "j" ];
	then
		if [ -f $LOHELP ];
		then
	       echo "Hilfedatei existiert - Weiter..."
		else
	       echo "FEHLER! Hilfedatei existiert nicht"
	       echo "Downloade sie bitte von http://de.libreoffice.org/download/"
	       echo "Alternativ, setze \$INSTALLHELP im Skript auf 'n' "
	       exit
		fi
fi
 
# Entpacken....
echo ""
echo "Entpacke LibreOffice... Dies dauert etwas..."
tar -xzf $LOINSTALL
tar -xzf $LOLANGUAGE
if [ "$INSTALLHELP" == "j" ];
then
   tar -xzf $LOHELP
fi
	

# Installiere LibreOffice 4
echo ""
echo "Fordere Root-Rechte an..."
echo "Schließe vorher LibreOffice (falls es offen ist)! "
echo ""
notify-send -t 8000 -i /usr/share/icons/gnome/32x32/status/dialog-warning.png "LibreOffice Installer" "'LibreOffice Installer' benötigt dein Root-Passwort. Ignoriere diese Meldung, falls du das Passwort in dieser Shell bereits eingegeben hast."
sudo dpkg -i $LOINSTALLFOLDER/*.deb

# Deutsches Sprachpaket
echo ""
echo "Eindeutschen..."
echo ""
sudo dpkg -i $LOLANGUAGEFOLDER/*.deb

# Hilfedateien, falls aktiviert
if [ "$INSTALLHELP" == "j" ];
then
   echo ""
   echo "Zu guter letzt: Hilfe installieren..."
   echo ""
   sudo dpkg -i $LOHELPFOLDER/*.deb
fi

# Aufräumen
echo ""
echo "Entferne Installationsdaten..."
echo ""
rm -r LibreOffice*Linux*

# Nachricht senden
notify-send -t 5000 -i /usr/share/icons/gnome/32x32/emotes/face-cool.png "LibreOffice Installer" "LibreOffice wurde installiert! "
