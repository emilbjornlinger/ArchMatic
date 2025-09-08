#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _    
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__ 
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "FINAL SETUP AND CONFIGURATION"

# ------------------------------------------------------------------------

# TO ADDRESS:
# Sway
# Power management config
# Sound/bluetooth system config
# Firewall config
# Touchpad config
# Dropbox/Dropbox autostart config
# Librewolf
# Nerdfont installation
# Aliases (part of dotfiles?)
# Neofetch, then add to chezmoi
# feh alias, then add to chezmoi
# wofi, then add to chezmoi

# Generate file template
# terminal using the "startx" command
cat <<EOF > ${HOME}/.<filename>
#!/bin/bash

<content>

EOF

# ------------------------------------------------------------------------


echo
echo "Setting laptop lid close to suspend CONFIGURE THIS"

sudo sed -i -e 's|[# ]*HandleLidSwitch[ ]*=[ ]*.*|HandleLidSwitch=suspend|g' /etc/systemd/logind.conf

# ------------------------------------------------------------------------

echo
echo "Disabling Pulse .esd_auth module CHECK IF NEEDED"

# Pulse audio loads the `esound-protocol` module, which best I can tell is rarely needed.
# That module creates a file called `.esd_auth` in the home directory which I'd prefer to not be there. So...
sudo sed -i 's|load-module module-esound-protocol-unix|#load-module module-esound-protocol-unix|g' /etc/pulse/default.pa

# ------------------------------------------------------------------------

echo
echo "Enabling bluetooth daemon and setting it to auto-start CHECK IF NEEDED"

sudo sed -i 's|#AutoEnable=false|AutoEnable=true|g' /etc/bluetooth/main.conf
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# ------------------------------------------------------------------------

echo
echo "Enabling Network Time Protocol so clock will be set via the network CHECK IF NEEDED""

sudo ntpd -qg
sudo systemctl enable ntpd.service
sudo systemctl start ntpd.service

# ------------------------------------------------------------------------

echo
echo "NETWORK SETUP"
echo "TODO"

echo
echo "Done!"
echo 
echo "Reboot now..."
echo
