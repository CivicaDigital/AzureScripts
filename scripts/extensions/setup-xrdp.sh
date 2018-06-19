#!/bin/sh
mkdir -p /usr/civica
touch /usr/civica/cloud-init.txt

# Scripts from:
# http://c-nergy.be/blog/?p=12198

echo $(date) ":DESKTOP Install" >> /usr/civica/cloud-init.txt

#---------------------------------------------------#
# Step 1 - Install xRDP Software.... 
#---------------------------------------------------#
echo $(date) ":xrdp installing..." >> /usr/civica/cloud-init.txt
sudo apt-get --assume-yes install xrdp
echo $(date) ":xrdp installed" >> /usr/civica/cloud-init.txt

#---------------------------------------------------#
# Step 2 - Install xfce4 Software.... 
#---------------------------------------------------#
echo $(date) ":xfce4 installing..." >> /usr/civica/cloud-init.txt
sudo apt-get --assume-yes install xfce4
echo $(date) ":xfce4 installed" >> /usr/civica/cloud-init.txt

#---------------------------------------------------#
# Step 3 - create policies exceptions .... 
#---------------------------------------------------#
echo $(date) ":Creating Polkit File..." >> /usr/civica/cloud-init.txt

sudo bash -c "cat >/etc/polkit-1/localauthority/50-local.d/45-allow.colord.pkla" <<EOF
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
EOF

echo $(date) ":Polkit file installed" >> /usr/civica/cloud-init.txt

echo $(date) ":DESKTOP Installed" >> /usr/civica/cloud-init.txt

