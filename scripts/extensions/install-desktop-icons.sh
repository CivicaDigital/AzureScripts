#!/bin/sh

# Install desktop files
cp *.desktop /usr/share/applications
mkdir ~/Desktop
sudo cp *.desktop ~/Desktop
sudo chmod +x ~/Desktop/*.desktop
cp *.desktop /usr/civica/scripts


cp *.sh /usr/civica/scripts

