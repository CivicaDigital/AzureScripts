#!/bin/sh

# Install desktop files
cp *.desktop /tmp

mkdir ~/Desktop
cp *.desktop ~/Desktop

mkdir -p /usr/civica/scripts
cp *.desktop /usr/civica/scripts

cp *.sh /usr/civica/scripts

