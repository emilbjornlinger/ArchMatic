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
echo "Write sway config, then add to chezmoi"
echo "Include swaylock and swayidle config:"
#exec swayidle -w
#	timeout 300 'swaylock -f -c 000000'
#	before-sleep 'swaylock -f -c 000000'
echo "Write lemurs config, then add to chezmoi"
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
## terminal using the "startx" command
#cat <<EOF > ${HOME}/.<filename>
##!/bin/bash
#
#<content>
#
#EOF

# ------------------------------------------------------------------------

echo
echo "Adding user to seat and enabling seatd service"

sudo groupadd seat
sudo gpasswd -a emil seat
sudo systemctl enable --now seatd.service

# ------------------------------------------------------------------------

echo
echo "Enabling and configuring lemurs"

sudo systemctl disable display-manager.service
sudo systemctl enable lemurs.service

sudo cat <<EOF > /etc/lemurs/wayland/sway
#!/bin/bash
exec sway
EOF

sudo chmod 755 /etc/lemurs/wayland/sway
# ------------------------------------------------------------------------

echo
echo "TODO: Add power saving configurations"

# ------------------------------------------------------------------------

echo
echo "Enable pipewire user services"

systemctl --user enable --now pipewire pipewire-pulse wireplumber

# ------------------------------------------------------------------------

sudo cat <<EOF > $HOME/.asoundrc
pcm.!default {
    type pulse
}

ctl.!default {
    type pulse
}
EOF

# ------------------------------------------------------------------------

echo
echo "Enable bluetooth service"

sudo systemctl enable --now bluetooth

# ------------------------------------------------------------------------

#echo
#echo "Disabling Pulse .esd_auth module CHECK IF NEEDED"
#
## Pulse audio loads the `esound-protocol` module, which best I can tell is rarely needed.
## That module creates a file called `.esd_auth` in the home directory which I'd prefer to not be there. So...
#sudo sed -i 's|load-module module-esound-protocol-unix|#load-module module-esound-protocol-unix|g' /etc/pulse/default.pa
#
## ------------------------------------------------------------------------
#
#echo
#echo "Enabling bluetooth daemon and setting it to auto-start CHECK IF NEEDED"
#
#sudo sed -i 's|#AutoEnable=false|AutoEnable=true|g' /etc/bluetooth/main.conf
#sudo systemctl enable bluetooth.service
#sudo systemctl start bluetooth.service
#
## ------------------------------------------------------------------------
#
#echo
#echo "Enabling Network Time Protocol so clock will be set via the network CHECK IF NEEDED""
#
#sudo ntpd -qg
#sudo systemctl enable ntpd.service
#sudo systemctl start ntpd.service
#
## ------------------------------------------------------------------------
#
#echo
#echo "NETWORK SETUP"
#echo "TODO"
#
#echo
#echo "Done!"
#echo 
#echo "Reboot now..."
#echo
