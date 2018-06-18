#!/bin/sh

# Scripts from:
# http://c-nergy.be/blog/?p=12198

echo $(date) ":DESKTOP Install" >> /tmp/cloud-init.txt

#---------------------------------------------------#
# Step 1 - Install xRDP Software.... 
#---------------------------------------------------#
echo $(date) ":xrdp installing..." >> /tmp/cloud-init.txt
sudo apt-get --assume-yes install xrdp
echo $(date) ":xrdp installed" >> /tmp/cloud-init.txt

#---------------------------------------------------#
# Step 2 - Install xfce4 Software.... 
#---------------------------------------------------#
echo $(date) ":xfce4 installing..." >> /tmp/cloud-init.txt
sudo apt-get --assume-yes install xfce4
echo $(date) ":xfce4 installed" >> /tmp/cloud-init.txt

#---------------------------------------------------#
# Step 3 - create policies exceptions .... 
#---------------------------------------------------#
echo $(date) ":Creating Polkit File..." >> /tmp/cloud-init.txt

sudo bash -c "cat >/etc/polkit-1/localauthority/50-local.d/45-allow.colord.pkla" <<EOF
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
EOF

echo $(date) ":Polkit file installed" >> /tmp/cloud-init.txt

echo $(date) ":DESKTOP Installed" >> /tmp/cloud-init.txt

