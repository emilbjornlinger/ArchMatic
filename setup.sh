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
echo "Install chezmoi, DONE"
echo "Write sway config, then add to chezmoi"
	# borders, bar, color scheme, background
echo "Import changes to nvim config from work computer, then add to chezmoi"
echo "Import starship config from work computer, then add to chezmoi"
echo "Write lemurs config, then add to chezmoi"
echo "Write starship config, then add to chezmoi"
echo "Write wpctl and bluetoothctl aliases, add to chezmoi"
echo "Install nerdfont JetBrains Mono Nerd Font, add to this config"
echo "Write feh alias/config, add to chezmoi"
echo "Write wofi config, add to chezmoi"
echo "Write AUR install script"
echo "Install AUR packages"
echo "Write dropbox config, add to chezmoi if applicable"
echo "Write librewolf config, add to chezmoi if applicable"

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

echo
echo "Setup firewall with nftables"

sudo systemctl enable --now nftables.service

# ------------------------------------------------------------------------

echo
echo "Create default user directories"

xdg-user-dirs-update

# ------------------------------------------------------------------------

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

#echo
#echo "Done!"
#echo 
#echo "Reboot now..."
#echo
