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

sudo bash -c 'cat <<EOF > /etc/lemurs/wayland/sway
#!/bin/bash
exec sway
EOF'

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

echo
echo "Installing Haskell"

read -n1 -p "Install Haskell? [y,n]" doit
case $doit in
    y|Y)
        TEMP_DIR=$(mktemp -d)
        cd "$TEMP_DIR"
        curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
        cd ..
        rm -rf "$TEMP_DIR"
        ;;
    *)
        echo -e "\nSkipping installation of Haskell"
        ;;
esac

# ------------------------------------------------------------------------

echo
echo "Installing LBNF TreeSitter"

read -n1 -p "Install LBNF TreeSitter? [y,n]" doit
case $doit in
    y|Y)
        git clone https://github.com/MortenSchou/tree-sitter-lbnf.git ~/build/tree-sitter-lbnf/
        ;;
    *)
        echo -e "\nSkipping installation of LBNF TreeSitter"
        ;;
esac

# ------------------------------------------------------------------------

echo
echo "Setup dropbox"

rm -rf ~/.dropbox-dist
install -dm0 ~/.dropbox-dist

read -n1 -p "Do start dropbox for the first time run 'dropbox start' and copy link to connect to computer. Then reboot and make sure the service is running and it is syncing. Press any key to continue [*]" doit
case $doit in
    *)
        echo -e "\nContinuing"
        ;;
esac

# ------------------------------------------------------------------------

echo
echo "Configuring ImageMagick"

read -n1 -p "Configure ImageMagick to handle pdfs? [y,n]" doit
case $doit in
    y|Y)
        name=$(find /etc/ImageMagick*/ -name "policy.xml")
        sudo sed -i "`wc -l < "$name"`i\\  <policy domain=\"coder\" rights=\"read|write\" pattern=\"PDF\" />\\" "$name"
        ;;
    *)
        echo -e "\nSkipping installation of Lua"
        ;;
esac
# ------------------------------------------------------------------------

echo
echo "Done!"
echo 
echo "Reboot now..."
echo
