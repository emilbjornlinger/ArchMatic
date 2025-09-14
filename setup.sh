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
echo "Write sway config, then add to chezmoi, DONE"
echo "Configure command line to have bigger font, add to chezmoi, DONE"
echo "Import changes to nvim config from work computer, then add to chezmoi, DONE"
echo "Import starship config from work computer, then add to chezmoi, DONE"
echo "Write lemurs config, then add to chezmoi, DONE (won't do)"
echo "Write starship config, then add to chezmoi, DONE"
echo "Write wpctl and bluetoothctl aliases, add to chezmoi, DONE"
echo "Install nerdfont JetBrains Mono Nerd Font, add to this config, DONE"
echo "Install Rust, lua compilers/toolchains, add to this config, DONE"
echo "Write feh alias/config, add to chezmoi"
echo "Write wofi config, add to chezmoi"
echo "Write AUR install script"
echo "Install AUR packages"
echo "Write dropbox config, add to chezmoi if applicable"
echo "Write librewolf config, add to chezmoi if applicable"
echo "Set new background"

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

echo
echo "Installing Jet Brains Mono Nerd Font"

read -n1 -p "Install font? [y,n]" doit
case $doit in
    y|Y)
        TEMP_DIR=$(mktemp -d)
        wget -O "$TEMP_DIR/font.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
        unzip "$TEMP_DIR/font.zip" -d "$TEMP_DIR"
        sudo mv "$TEMP_DIR"/*.{ttf,otf} /usr/share/fonts/
        fc-cache -f -v
        rm -rf "$TEMP_DIR"
        ;;
    *)
        echo -e "\nSkipping installation of Jet Brains Mono Nerd Font"
        ;;
esac


# ------------------------------------------------------------------------

echo
echo "Installing Rust"

read -n1 -p "Install Rust? [y,n]" doit
case $doit in
    y|Y)
        touch ~/.zshenv
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
        ;;
    *)
        echo -e "\nSkipping installation of Rust"
        ;;
esac

# ------------------------------------------------------------------------

echo
echo "Installing Lua"

read -n1 -p "Install Lua? [y,n]" doit
case $doit in
    y|Y)
        TEMP_DIR=$(mktemp -d)
        cd "$TEMP_DIR"
        curl -L -R -O https://www.lua.org/ftp/lua-5.4.8.tar.gz
        tar zxf lua-5.4.8.tar.gz
        cd lua-5.4.8
        sudo make all install
        cd ../..
        rm -rf "$TEMP_DIR"
        ;;
    *)
        echo -e "\nSkipping installation of Lua"
        ;;
esac

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
