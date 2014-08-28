install-libreoffice
===================

**Installationshelfer für LibreOffice ohne PPA**  
Getestet unter Ubuntu 13.04, 13.10 und 14.04, sowohl 32- als auch 64-Bit. 
Dieses kleine Skript war eher mehr ein Test um meine Fähigkeiten im Umgang mit der Bash zu testen.  
Herausgekommen ist ein einfacher Installer für LibreOffice.  
Du kannst damit LibreOffice installieren und aktualisieren, vorausgesetzt, du lädst dir die aktuellen .tar.gz Pakete!

## Benutzung
Lade die .tar.gz Pakete von der LibreOffice-Seite ([Stable](http://de.libreoffice.org/download/) oder [Testing](http://de.libreoffice.org/download/testversionen/)) (Es werden nur LibreOffice selber und die Sprachpakete benötigt - achte darauf, dass du auf ".deb" eingestellt hast!))

    curl -O https://raw.githubusercontent.com/Brawl345/install-libreoffice/master/install-lo4.sh
    chmod +x install-lo4.sh
    ./install-lo4.sh
